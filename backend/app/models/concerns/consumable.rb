require "active_support/concern"

# https://api.rubyonrails.org/classes/ActiveSupport/Concern.html
# Concerns make it easy to share code across different Classes and Modules.
# This module provides reusable logic for Log and MealItem entries. It handles the validation
# of grams vs. servings and the conversion of servings into grams for consistent data storage.
module Consumable

  extend ActiveSupport::Concern

  included do
    # A custom validation to ensure at least one of the fields is present.
    # Once one value is populated, however, we handle the conversion
    # so both fields will eventually have a value.
    validate :one_field_must_be_present

    # This callback runs before validation. It checks which field is present
    # and calculates the other accordingly.
    before_validation :convert_fields
  end

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
