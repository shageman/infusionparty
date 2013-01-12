require 'saulabs/trueskill'

class AdventureComparison
  include ::Saulabs::TrueSkill

  def initialize
    @adventure_drinks = Drink.all
    @adventure_drinks.map do |drink|
      drink.adventure_rating = Rating.new(1500.0, 1000.0, 1.0)
    end
  end

  def recalculate_all_skills
    Vote.all.each do |vote|
      drink1 = drink1(@adventure_drinks, vote, :adventure_rating)
      drink2 = drink2(@adventure_drinks, vote, :adventure_rating)
      if vote.most_drinkable == 0
        FactorGraph.new([drink1, drink2], [1,2]).update_skills
      elsif vote.most_drinkable == 1
        FactorGraph.new([drink2, drink1], [1,2]).update_skills
      end
    end
    @adventure_drinks.each do |drink|
      drink.adventure_mean = drink.adventure_rating.mean
      drink.adventure_deviation = drink.adventure_rating.deviation
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
