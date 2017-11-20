class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :days, :show_number, :day_of_tour
  	remove_column :days, :show_status
  	remove_column :days, :venue_id
  	remove_column :days, :guest_list
  	remove_column :days, :income_id
  	remove_column :days, :schedule_id
    remove_column :schedules, :bus_call_am
    remove_column :schedules, :bus_call_hotel
  	remove_column :incomes, :day_id
  	remove_column :incomes, :tour_name
  	remove_column :incomes, :user_id
    remove_column :days, :hotel_expenses
    remove_column :days, :day_of_tour
    remove_column :schedules, :time_zone
    add_column :days, :time_zone, :string
  end
end
