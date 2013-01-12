class Vote < ActiveRecord::Base
  belongs_to :drink1, class_name: "drink"
  belongs_to :drink2, class_name: "drink"
  belongs_to :category
  attr_accessible :answer, :drink1_id, :drink2_id, :category_id
end
