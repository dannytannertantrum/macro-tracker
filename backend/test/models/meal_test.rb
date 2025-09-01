# https://guides.rubyonrails.org/testing.html
require "test_helper"

class MealTest < ActiveSupport::TestCase
  test "total_macros calculates the sum of all meal items" do
    # https://guides.rubyonrails.org/active_record_validations.html
    # The ! means save the object to the database only if the object is valid
    food = Food.create!(
      name: "My favorite food (obviously)",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98,
      calories_per_serving: 140.0
    )

    meal = Meal.create!(name: "My Meal")

    meal_item_1 = MealItem.create!(
      meal: meal,
      food: food,
      grams_consumed: food.single_serving_grams
    )
    meal_item_2 = MealItem.create!(
      meal: meal,
      food: food,
      grams_consumed: food.single_serving_grams / 2
    )

    expected_macros = {
      carbs: 15,
      fat: 3,
      protein: 15
    }

    expected_calories = 210

    assert_equal expected_macros, meal.total_macros
    assert_equal expected_calories, meal.total_calories
  end
end
