class Vote < ActiveRecord::Base
  belongs_to :drink1, class_name: "drink"
  belongs_to :drink2, class_name: "drink"
  attr_accessible :drink1_id, :drink2_id, :best_presentation, :most_drinkable, :most_adventerous
end
