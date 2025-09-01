class Api::MealsController < ApplicationController
  before_action :set_meal, only: %i[ show update destroy ]

  # GET /meals
  def index
    @meals = Meal.all

    render json: @meals, methods: [:total_macros, :total_calories]
  end

  # GET /meals/1
  def show
    render json: @meal, methods: [:total_macros, :total_calories]
  end

  # POST /meals
  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      render json: @meal, methods: [:total_macros, :total_calories], status: :created, location: api_meal_url(@meal)
    else
      render json: @meal.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /meals/1
  def update
    if @meal.update(meal_params)
      render json: @meal, methods: [:total_macros, :total_calories]
    else
      render json: @meal.errors, status: :unprocessable_content
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.expect(meal: [ :name ])
    end
end
