class ResultsController < ApplicationController
  def index
    @votes = Vote.all
  end
end
