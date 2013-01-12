class Vote < ActiveRecord::Base
  belongs_to :drink1
  belongs_to :drink2
  belongs_to :category
  attr_accessible :answer
end
