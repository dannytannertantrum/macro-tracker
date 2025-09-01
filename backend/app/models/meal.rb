# This model represents a user-created meal, which is a collection of foods
class Meal < ApplicationRecord
  # A meal has many meal items, which are the join records that link a meal to its foods.
  # dependent: :destroy option ensures that when a meal is deleted, all of its
  # associated meal items are also destroyed.
  has_many :meal_items, dependent: :destroy

  # This association allows for easy access to the food items through the meal_items (join model).
  # zero to many
  # https://guides.rubyonrails.org/association_basics.html#has-many-through
  has_many :foods, through: :meal_items

  def total_macros
    total_macros_hash = { carbs: 0, fat: 0, protein: 0 }

    meal_items.each do |meal_item|
      item_macros = meal_item.total_macros

      total_macros_hash[:carbs] += item_macros[:carbs]
      total_macros_hash[:fat] += item_macros[:fat]
      total_macros_hash[:protein] += item_macros[:protein]
    end

    total_macros_hash.transform_values { |value| value.round(2) }
  end
end
