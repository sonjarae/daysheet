class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  # GET /days
  # GET /days.json
  def index
    if params[:search]
      @days = Day.search(params[:search]).order("created_at DESC")
    else
      @days = Day.all.order("created_at DESC")
    end
  end

  # GET /days/1
  # GET /days/1.json
  def show
    @tour = Tour.find( @day.tour_id.to_s )
    @income = Income.where ('schedule_id => ids')
  end

  # GET /days/new
  def new
    @day = Day.new(new_day_params)
    if(params[:tour_id] != nil)
      @this_tour = Tour.find(params[:tour_id]).name
    end
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days
  # POST /days.json
  def create
    @day = Day.new(day_params)

    respond_to do |format|
      if @day.save
        format.html { redirect_to @day, notice: 'Day was successfully created.' }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url, notice: 'Day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    def new_day_params
      params.permit(:date, :tour_id, :notes, :city, 
        :day_of_tour, :bus_call_hotel, :bus_call_am, :venue_id,
        :per_diem_exp, :gas_exp, :hotel_exp, :other_expenses)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_params
      params.require(:day).permit(:name, :date, :tour_id, :notes, :city, 
        :day_of_tour, :bus_call_hotel, :bus_call_am, :venue_id,
        :per_diem_exp, :gas_exp, :hotel_exp, :other_expenses, :search)
    end
end
