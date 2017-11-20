class UpdateSchedule < ActiveRecord::Migration[5.1]
  def change
  	add_column :schedules, :show_number, :string
  	add_column :schedules, :show_status, :string
  	add_column :schedules, :day_id, :integer
  	add_column :schedules, :tour_id, :integer
  	add_column :schedules, :venue_id, :integer
  	add_column :schedules, :guest_list, :string
  	add_column :schedules, :income_id, :integer 
    add_column :schedules, :time_zone, :string
  	add_column :incomes, :schedule_id, :integer
    add_column :incomes, :tour_id, :integer    
  end
end
