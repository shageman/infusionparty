class Drink < ActiveRecord::Base
  attr_accessible :description, :name, :deviation, :mean, :name
  attr_accessor :drinkable_rating, :presentable_rating, :adventure_rating
end
