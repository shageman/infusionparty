class ResultsController < ApplicationController
  def index
    res = "drink1 drink2 presentation drinkability adventurousness"
    res2 = Vote.all.inject(res) do |result, vote|
      result += "\n"
      result += "#{vote.drink1.id} #{vote.drink2.id} #{vote.best_presentation} #{vote.most_drinkable} #{vote.most_adventurous}"
      result
    end

    render text: res2, content_type: 'text/plain'
  end
end
