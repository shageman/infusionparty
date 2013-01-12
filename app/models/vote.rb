class Vote < ActiveRecord::Base
  belongs_to :drink1, class_name: "Drink"
  belongs_to :drink2, class_name: "Drink"
  attr_accessible :drink1, :drink2, :best_presentation, :most_drinkable, :most_adventurous
end
