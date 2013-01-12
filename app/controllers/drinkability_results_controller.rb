class DrinkabilityResultsController < ApplicationController
  def index
    DrinkableComparison.new.recalculate_all_skills
    @drinks = Drink.order("drinkable_mean DESC").all
  end
end
