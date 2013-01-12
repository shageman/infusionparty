require 'saulabs/trueskill'

class DrinkableComparison
  include ::Saulabs::TrueSkill

  def initialize
    @drinkable_drinks = Drink.all
    @drinkable_drinks.map do |drink|
      drink.drinkable_rating = Rating.new(1500.0, 1000.0, 1.0)
    end
  end

  def recalculate_all_skills
    Vote.all.each do |vote|
      drink1 = drink1(@drinkable_drinks, vote, :drinkable_rating)
      drink2 = drink2(@drinkable_drinks, vote, :drinkable_rating)
      if vote.most_drinkable == 0
        FactorGraph.new([drink1, drink2], [1,2]).update_skills
      elsif vote.most_drinkable == 1
        FactorGraph.new([drink2, drink1], [1,2]).update_skills
      end
    end
    @drinkable_drinks.each do |drink|
      drink.drinkable_mean = drink.drinkable_rating.mean
      drink.drinkable_deviation = drink.drinkable_rating.deviation
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
