class MealItem < ApplicationRecord
  belongs_to :meal
  belongs_to :food
  validates :meal, presence: true
end
