class LogsController < ApplicationController
  before_action :set_log, only: %i[ show update destroy ]

  # GET /logs
  def index
    @logs = Log.all

    render json: @logs, methods: [:total_macros]
  end

  # GET /logs/1
  def show
    render json: @log, methods: [:total_macros]
  end

  # POST /logs
  def create
    @log = Log.new(log_params)

    if @log.save
      render json: @log, methods: [:total_macros], status: :created, location: @log
    else
      render json: @log.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /logs/1
  def update
    if @log.update(log_params)
      render json: @log, methods: [:total_macros]
    else
      render json: @log.errors, status: :unprocessable_content
    end
  end

  # DELETE /logs/1
  def destroy
    @log.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.expect(log: [ :food_id, :grams_consumed, :number_of_servings, :meal_type ])
    end
end
