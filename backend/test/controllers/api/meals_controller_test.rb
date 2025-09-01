require "test_helper"

class Api::MealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal = meals(:one)
  end

  test "should get index" do
    get api_meals_url, as: :json
    assert_response :success
  end

  test "should create meal" do
    assert_difference("Meal.count") do
      post api_meals_url, params: { meal: { name: @meal.name } }, as: :json
    end

    assert_response :created

    json = JSON.parse(@response.body)
    assert json.key?("total_macros")
    assert_kind_of Hash, json["total_macros"]
    json["total_macros"].each do |key, value|
      assert value.is_a?(Numeric), "Expected #{key} to be a number, but was #{value.class}"
    end
  end

  test "should show meal" do
    get api_meal_url(@meal), as: :json

    assert_response :success

    json = JSON.parse(@response.body)
    assert json.key?("total_macros")
    assert_kind_of Hash, json["total_macros"]
    json["total_macros"].each do |key, value|
      assert value.is_a?(Numeric), "Expected #{key} to be a number, but was #{value.class}"
    end
  end

  test "should update meal" do
    patch api_meal_url(@meal), params: { meal: { name: @meal.name } }, as: :json

    assert_response :success

    json = JSON.parse(@response.body)
    assert json.key?("total_macros")
    assert_kind_of Hash, json["total_macros"]
    json["total_macros"].each do |key, value|
      assert value.is_a?(Numeric), "Expected #{key} to be a number, but was #{value.class}"
    end
  end

  test "should destroy meal" do
    assert_difference("Meal.count", -1) do
      delete api_meal_url(@meal), as: :json
    end

    assert_response :no_content
  end
end
