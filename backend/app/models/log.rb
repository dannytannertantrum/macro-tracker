# This model represents a single log entry for a food item consumed by a user.
# It belongs to a Food item and stores the amount consumed, either in grams or as a number of servings.
class Log < ApplicationRecord
  belongs_to :food
  enum :meal_type, [ :breakfast, :lunch, :dinner, :snack ]
  validates :meal_type, presence: true

  include Consumable
end
