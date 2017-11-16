class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    p "in tours_controller"
    
    if @tour != nil
      @days = Day.where("tour_id = " + @tour.id.to_s ).all
    else 
      @days = []
    end

    # @current_tour = Tour.where( 'tours.end_date BETWEEN ? AND ?', Date.today, 1.month.from_now ).order('start_date DESC').first
    # @days_for_tour = Tour.joins(:days).where(:days => {:tour_id => @tour.id})
    #render :viewname, :layout => false
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @tour = Tour.find(params[:id])
    
    if @tour != nil
      @days = Day.where("tour_id = " + @tour.id.to_s ).all
    else 
      @days = []
    end
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:name, :id, :start_date, :end_date, :active).update_attributes(:id)
    end
end
