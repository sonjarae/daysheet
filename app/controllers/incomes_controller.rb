class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  # GET /incomes
  # GET /incomes.json
  def index
    if params[:search]
      @incomes = Income.search(params[:search]).order("created_at DESC")
    else
      @incomes = Income.all
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    @total_income = 0
    @schedule = Schedule.find(@income.schedule_id)
    @day = Day.find(@schedule.day_id)
  end

  # GET /incomes/new
  def new
    @income = Income.new(schedule_id: params[:schedule_id], tour_id: params[:tour_id] )
    
    @schedule = Schedule.find(@income.schedule_id)
    @schedule.update(income_id: params[:id])
    
    @day = Day.find(@schedule.day_id)
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params)
    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to @income, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_params
      params.require(:income).permit(:guarantee, :tour_name, :schedule_id, :tour_id)
    end
end
