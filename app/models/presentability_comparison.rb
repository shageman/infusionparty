require 'saulabs/trueskill'

class PresentabilityComparison
  include ::Saulabs::TrueSkill

  def initialize
    @drinks = Drink.all
    @drinks.map do |drink|
      drink.presentable_rating = Rating.new(1500.0, 1000.0, 1.0)
    end
  end

  def recalculate_all_skills
    Vote.all.each do |vote|
      drink1 = drink1(@drinks, vote, :presentable_rating)
      drink2 = drink2(@drinks, vote, :presentable_rating)
      if vote.best_presentation == 0
        FactorGraph.new([drink1, drink2], [1,2]).update_skills
      elsif vote.best_presentation == 1
        FactorGraph.new([drink2, drink1], [1,2]).update_skills
      end
    end
    @drinks.each do |drink|
      drink.presentation_mean = drink.presentable_rating.mean
      drink.presentation_deviation = drink.presentable_rating.deviation
    end.each &:save!
  end

  def drink1(drinks, vote, rating_method)
    [find(drinks, vote.drink1_id).send(rating_method)]
  end

  def drink2(drinks, vote, rating_method)
    [find(drinks, vote.drink2_id).send(rating_method)]
  end

  def find(drinks, id)
    drinks.select { |drink| drink.id == id }.first
  end
end
