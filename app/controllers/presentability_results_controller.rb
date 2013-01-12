class PresentabilityResultsController < ApplicationController
  def index
    PresentabilityComparison.new.recalculate_all_skills
    @drinks = Drink.order("presentation_mean DESC").all
  end
end
