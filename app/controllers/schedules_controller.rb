class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
     if params[:search]
        @schedules = Schedule.search(params[:search]).order("created_at DESC")
      else
      @schedules = Schedule.all.order("created_at DESC")
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @venues = Venue.all
    @days_for_tour = Day.where('days.tour_id = '+@schedule.tour_id.to_s)
    @day = Day.find(@schedule.day_id)
    if @schedule.income_id != nil
      @settlement = Income.find(@schedule.income_id)  
    end
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new(day_id: params[:day_id], tour_id: params[:tour_id] )
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    p "sent params: " + schedule_params.to_s
    @schedule = Schedule.new(schedule_params)
    @schedule.venue_name = Venue.where('venues.id = ' + @schedule.venue_id.to_s).name
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to schedules_url, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to schedules_url, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:id, 
        :load_in_time,:set_time,:income_id,
        :sound_check_time,:doors_time,:show_status,
        :tour_id,:venue_id,:day_id,:guest_list,
        :booking_contact, :production_contact, 
        :sound_contact, :show_schedule, :ticket_link, :venue_name)
    end
end
