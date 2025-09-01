require "test_helper"

class LogTest < ActiveSupport::TestCase
  test "total_macros accurately calculates macros for the log" do
    food = Food.create!(
      name: "Simple Food",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98
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

    assert_equal expected_macros, log.total_macros
  end
end
