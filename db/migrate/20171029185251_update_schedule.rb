class UpdateSchedule < ActiveRecord::Migration[5.1]
  def change
  	add_column :schedules, :show_number, :string
  	add_column :schedules, :show_status, :string
  	add_column :schedules, :day_id, :integer
  	add_column :schedules, :tour_id, :integer
  end
end
