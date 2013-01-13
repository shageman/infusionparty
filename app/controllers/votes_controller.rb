class VotesController < ApplicationController
  def new
    drinks = Drink.all.sample(2)
    @vote = Vote.new(drink1: drinks.first, drink2: drinks.second)
  end

  def create
    @vote = Vote.new(params[:vote])

    if @vote.save
      redirect_to root_url, flash: { notice: 'Vote was successfully created.' }
    else
      redirect_to root_url, flash: { error: "The Vote was not cast: Please skip if you don't want to pick one" }
    end
  end
end
