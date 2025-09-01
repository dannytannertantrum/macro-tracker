require "test_helper"

class MealItemTest < ActiveSupport::TestCase
  test "total_macros are accurately calculated for a MealItem entry using number_of_servings" do
    food = Food.create!(
      name: "Simple Food",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98,
      calories_per_serving: 140
    )

    meal = Meal.create!(name: "Protein Immune Booster Smoothie")

    meal_item = MealItem.create!(
      meal: meal,
      food: food,
      number_of_servings: 2
    )

    expected_macros = {
      carbs: 20,
      fat: 4,
      protein: 20
    }

    expected_calories = 280

    assert_equal expected_macros, meal_item.total_macros
    assert_equal expected_calories, meal_item.total_calories
  end

  test "total_macros are accurately calculated for a MealItem entry using grams_consumed" do
    food = Food.create!(
      name: "Simple Food",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98,
      calories_per_serving: 140
    )

    meal = Meal.create!(name: "Protein Immune Booster Smoothie")

    meal_item = MealItem.create!(
      meal: meal,
      food: food,
      grams_consumed: food.single_serving_grams * 2
    )

    expected_macros = {
      carbs: 20,
      fat: 4,
      protein: 20
    }

    expected_calories = 280

    assert_equal expected_macros, meal_item.total_macros
    assert_equal expected_calories, meal_item.total_calories
  end
end
