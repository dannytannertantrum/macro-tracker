require "test_helper"

class MealItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_item = meal_items(:one)
  end

  test "should get index" do
    get meal_items_url, as: :json
    assert_response :success
  end

  test "should create meal_item" do
    assert_difference("MealItem.count") do
      post meal_items_url, params: { meal_item: { food_id: @meal_item.food_id, grams_consumed: @meal_item.grams_consumed, meal_id: @meal_item.meal_id, number_of_servings: @meal_item.number_of_servings } }, as: :json
    end

    assert_response :created
  end

  test "should show meal_item" do
    get meal_item_url(@meal_item), as: :json
    assert_response :success
  end

  test "should update meal_item" do
    patch meal_item_url(@meal_item), params: { meal_item: { food_id: @meal_item.food_id, grams_consumed: @meal_item.grams_consumed, meal_id: @meal_item.meal_id, number_of_servings: @meal_item.number_of_servings } }, as: :json
    assert_response :success
  end

  test "should destroy meal_item" do
    assert_difference("MealItem.count", -1) do
      delete meal_item_url(@meal_item), as: :json
    end

    assert_response :no_content
  end
end
