class AdventureResultsController < ApplicationController
  def index
    AdventureComparison.new.recalculate_all_skills
    @drinks = Drink.order("adventure_mean DESC").all
  end
end
