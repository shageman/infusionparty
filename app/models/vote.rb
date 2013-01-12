class Vote < ActiveRecord::Base
  belongs_to :drink1, class_name: "Drink"
  belongs_to :drink2, class_name: "Drink"
  attr_accessible :drink1, :drink2, :best_presentation, :most_drinkable, :most_adventurous

  validates_presence_of :drink1, :drink2

  validate :at_least_one_opinion_given

  def at_least_one_opinion_given
    unless best_presentation.present? || most_drinkable.present? || most_adventurous.present?
      errors[:best_presentation] << 'Please give at least one opinion!'
    end
  end
end
