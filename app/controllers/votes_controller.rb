class VotesController < ApplicationController
  def new
    drinks = Drink.all.sample(2)
    @vote = Vote.new(drink1: drinks.first, drink2: drinks.second)
  end

  def create
    @vote = Vote.new(params[:vote])

    if @vote.save
      redirect_to new_vote_url, notice: 'Vote was successfully created.'
    else
      render action: "new"
    end
  end
end
