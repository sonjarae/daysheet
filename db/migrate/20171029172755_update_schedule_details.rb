class UpdateScheduleDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :schedules, :sound_check_time, :datetime
  	add_column :schedules, :doors_time, :datetime
  	add_column :schedules, :set_time, :datetime
  	add_column :schedules, :bus_call_am, :datetime
  	add_column :schedules, :bus_call_hotel, :datetime
  	add_column :schedules, :time_between_bands_calc, :integer
  	add_column :schedules, :notes, :string
  end
end
