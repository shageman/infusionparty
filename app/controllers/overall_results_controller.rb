class OverallResultsController < ApplicationController
  def index
    @drinks = Drink.order("adventure_mean + presentation_mean + drinkable_mean DESC").all
  end
end
