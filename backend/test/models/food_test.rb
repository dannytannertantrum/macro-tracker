require "test_helper"

class FoodTest < ActiveSupport::TestCase
  test "should not save food without name" do
    food = Food.create(
      name: "",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98,
      calories_per_serving: 140
    )
    assert_not food.save, "Saved the food without a name"
  end

  test "should save food with name" do
    food = Food.new(
      name: "Chicken Breast",
      carbs_per_gram: 10,
      fat_per_gram: 2,
      protein_per_gram: 10,
      single_serving_grams: 98,
      calories_per_serving: 140
    )
    assert food.save, "Could not save the food with a name"
  end
end
