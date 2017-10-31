class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
  	rename_column :days, :show_number, :day_of_tour
  	remove_column :days, :show_status
  end
end
