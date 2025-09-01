require "test_helper"

class FoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food = foods(:one)
  end

  test "should get index" do
    get foods_url, as: :json
    assert_response :success
  end

  test "should create food" do
    assert_difference("Food.count") do
      post foods_url, params: {
        food: {
          carbs_per_gram: @food.carbs_per_gram,
          fat_per_gram: @food.fat_per_gram,
          name: @food.name,
          protein_per_gram: @food.protein_per_gram,
          serving_unit_name: @food.serving_unit_name,
          single_serving_grams: @food.single_serving_grams
        }
      }, as: :json
    end

    assert_response :created
  end

  test "should show food" do
    get food_url(@food), as: :json
    assert_response :success
  end

  test "should update food" do
    patch food_url(@food), params: {
      food: {
        carbs_per_gram: @food.carbs_per_gram,
        fat_per_gram: @food.fat_per_gram,
        name: @food.name,
        protein_per_gram: @food.protein_per_gram,
        serving_unit_name: @food.serving_unit_name,
        single_serving_grams: @food.single_serving_grams
      }
    }, as: :json
    assert_response :success
  end

  test "should destroy food" do
    assert_difference("Food.count", -1) do
      delete food_url(@food), as: :json
    end

    assert_response :no_content
  end
end
