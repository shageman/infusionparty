class AdventureResultsController < ApplicationController
  def index
    AdventureComparison.new.recalculate_all_skills
    @drinks = Drink.order("adventure_mean DESC").all
  end

  def big_results
    DrinkableComparison.new.recalculate_all_skills
    @drinkable = Drink.order("drinkable_mean DESC").all

    DrinkableComparison.new.recalculate_all_skills
    @adventure = Drink.order("adventure_mean DESC").all

    DrinkableComparison.new.recalculate_all_skills
    @presentable = Drink.order("presentation_mean DESC").all
  end
end
