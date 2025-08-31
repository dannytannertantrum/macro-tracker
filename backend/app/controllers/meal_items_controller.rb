class MealItemsController < ApplicationController
  before_action :set_meal_item, only: %i[ show update destroy ]

  # GET /meal_items
  def index
    @meal_items = MealItem.all

    render json: @meal_items
  end

  # GET /meal_items/1
  def show
    render json: @meal_item
  end

  # POST /meal_items
  def create
    @meal_item = MealItem.new(meal_item_params)

    if @meal_item.save
      render json: @meal_item, status: :created, location: @meal_item
    else
      render json: @meal_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meal_items/1
  def update
    if @meal_item.update(meal_item_params)
      render json: @meal_item
    else
      render json: @meal_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meal_items/1
  def destroy
    @meal_item.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_item
      @meal_item = MealItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def meal_item_params
      params.expect(meal_item: [ :meal_id, :food_id, :grams_consumed, :number_of_servings ])
    end
end
