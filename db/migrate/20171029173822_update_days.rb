class UpdateDays < ActiveRecord::Migration[5.1]
  def change
  	add_column :days, :guest_list, :string
  	add_column :days, :hotel_expenses, :decimal
  	add_column :days, :other_expenses, :decimal
  	add_column :days, :bus_call_am, :datetime
    add_column :days, :bus_call_hotel, :datetime
    add_column :days, :notes, :string
    add_column :days, :per_diem_exp, :decimal
    add_column :days, :gas_exp, :decimal
    add_column :days, :hotel_exp, :decimal
    add_column :days, :city, :string
    add_column :tours, :per_diem_budget, :decimal
    add_column :tours, :gas_budget, :decimal
    add_column :tours, :hotel_budget, :decimal
    add_column :tours, :region, :string
    add_column :tours, :est_income, :decimal
  end
end
