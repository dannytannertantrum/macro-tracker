class Meal < ApplicationRecord
  has_many :meal_items, dependent: :destroy
  validates :name, presence: true
end
