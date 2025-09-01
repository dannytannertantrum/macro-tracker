require "test_helper"

class Api::LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log = logs(:one)
  end

  test "should get index" do
    get api_logs_url, as: :json
    assert_response :success
  end

  test "should create log" do
    assert_difference("Log.count") do
      post api_logs_url, params: {
        log: {
          food_id: @log.food_id,
          grams_consumed: @log.grams_consumed,
          number_of_servings: @log.number_of_servings,
          meal_type: @log.meal_type
        }
      }, as: :json

      json = JSON.parse(@response.body)
      assert json.key?("total_macros")
      assert_kind_of Hash, json["total_macros"]
      json["total_macros"].each do |key, value|
        assert value.is_a?(Numeric), "Expected #{key} to be a number, but was #{value.class}"
      end
    end

    assert_response :created

    json = JSON.parse(@response.body)
    assert json.key?("total_macros")
    assert_kind_of Hash, json["total_macros"]
    json["total_macros"].each do |key, value|
      assert value.is_a?(Numeric), "Expected #{key} to be a number, but was #{value.class}"
    end
  end

  test "should show log" do
    get api_log_url(@log), as: :json
    assert_response :success

    json = JSON.parse(@response.body)
    assert json.key?("total_macros")
    assert_kind_of Hash, json["total_macros"]
    json["total_macros"].each do |key, value|
      assert value.is_a?(Numeric), "Expected #{key} to be a number, but was #{value.class}"
    end
  end

  test "should update log" do
    patch api_log_url(@log), params: {
      log: {
        food_id: @log.food_id,
        grams_consumed: @log.grams_consumed,
        number_of_servings: @log.number_of_servings,
        meal_type: @log.meal_type
      }
    }, as: :json
    assert_response :success

    json = JSON.parse(@response.body)
    assert json.key?("total_macros")
    assert_kind_of Hash, json["total_macros"]
    json["total_macros"].each do |key, value|
      assert value.is_a?(Numeric), "Expected #{key} to be a number, but was #{value.class}"
    end
  end

  test "should destroy log" do
    assert_difference("Log.count", -1) do
      delete api_log_url(@log), as: :json
    end

    assert_response :no_content
  end
end
