class DrinksController < ApplicationController
  def index
    @drinks = Drink.order(:name).all
  end

  def new
    @drink = Drink.new
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def create
    @drink = Drink.new(params[:drink])

    if @drink.save
      redirect_to drinks_url, notice: 'Drink was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @drink = Drink.find(params[:id])

    if @drink.update_attributes(params[:drink])
      redirect_to drinks_url, notice: 'Drink was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy

    redirect_to drinks_url
  end
end
