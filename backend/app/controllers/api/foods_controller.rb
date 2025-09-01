class Api::FoodsController < ApplicationController
  before_action :set_food, only: %i[ show update destroy ]

  # GET /foods
  def index
    @foods = Food.all

    render json: @foods
  end

  # GET /foods/1
  def show
    render json: @food
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food, status: :created, location: api_food_url(@food)
    else
      render json: @food.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_content
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.expect(food: [ :name, :carbs_per_gram, :fat_per_gram, :protein_per_gram, :single_serving_grams, :serving_unit_name, :calories_per_serving ])
    end
end
