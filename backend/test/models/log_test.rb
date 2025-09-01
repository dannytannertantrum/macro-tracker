require "test_helper"

class LogTest < ActiveSupport::TestCase
  test "total_macros are accurately calculated for a Log entry using grams_consumed" do
    food = Food.create!(
      name: "Simple Food",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98,
      calories_per_serving: 140
    )

    log = Log.create!(
      food: food,
      grams_consumed: 196,
      meal_type: 0,
    )

    expected_macros = {
      carbs: 20,
      fat: 4,
      protein: 20
    }

    expected_calories = 280

    assert_equal expected_macros, log.total_macros
    assert_equal expected_calories, log.total_calories
  end

  test "total_macros are accurately calculated for a Log entry using number_of_servings" do
    food = Food.create!(
      name: "Simple Food",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98,
      calories_per_serving: 140
    )

    log = Log.create!(
      food: food,
      number_of_servings: 2,
      meal_type: 0,
    )

    expected_macros = {
      carbs: 20,
      fat: 4,
      protein: 20
    }

    expected_calories = 280

    assert_equal expected_macros, log.total_macros
    assert_equal expected_calories, log.total_calories
  end
end
