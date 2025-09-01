class Food < ApplicationRecord
  has_many :logs, dependent: :destroy
  has_many :meal_items, dependent: :destroy
  has_many :meals, through: :meal_items
  validates :name, presence: { message: "Name is required" }
  validates :carbs_per_gram, presence: { message: "Carbs per gram is required" }
  validates :fat_per_gram, presence: { message: "Fat per gram is required" }
  validates :protein_per_gram, presence: { message: "Protein per gram is required" }
  validates :single_serving_grams, presence: { message: "Single serving grams is required" }
  validates :calories_per_serving, presence: { message: "Calories per serving is required" }
end
