# This model represents a single log entry for a food item consumed by a user.
# It belongs to a Food item and stores the amount consumed, either in grams or as a number of servings.
class Log < ApplicationRecord
  belongs_to :food
  enum :meal_type, [ :breakfast, :lunch, :dinner, :snack ]
  validates :meal_type, presence: true

  # A custom validation to ensure at least one of the fields is present.
  # Handle the conversion so both fields will eventually have a value.
  validate :one_field_must_be_present

  # This callback runs before validation. It checks which field is present
  # and calculates the other accordingly.
  before_validation :convert_fields

  # Calculates the total macros for this log entry based on the food and grams consumed.
  def total_macros
    return unless food && grams_consumed

    total_carbs = food.carbs_per_gram * grams_consumed
    total_fat = food.fat_per_gram * grams_consumed
    total_protein = food.protein_per_gram * grams_consumed

    {
      carbs: total_carbs.round(2),
      fat: total_fat.round(2),
      protein: total_protein.round(2)
    }
  end

  private

  def one_field_must_be_present
    if grams_consumed.blank? && number_of_servings.blank?
      errors.add(:base, 'Must specify either grams_consumed or number_of_servings.')
    end
  end

  def convert_fields
    return unless food
    if grams_consumed.present? && number_of_servings.blank?
      convert_grams_to_servings
    elsif number_of_servings.present? && grams_consumed.blank?
      convert_servings_to_grams
    end
  end

  def convert_servings_to_grams
    self.grams_consumed = number_of_servings * food.single_serving_grams
  end

  def convert_grams_to_servings
    self.number_of_servings = grams_consumed / food.single_serving_grams
  end
end
