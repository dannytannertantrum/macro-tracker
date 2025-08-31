class Log < ApplicationRecord
  belongs_to :food
  enum :meal_type, [ :breakfast, :lunch, :dinner, :snack ]
  validates :meal_type, presence: true
end
