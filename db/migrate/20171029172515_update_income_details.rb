class UpdateIncomeDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :incomes, :attendance_paid, :integer
    add_column :incomes, :attendance_total, :integer
    add_column :incomes, :attendance_comped, :integer
    add_column :incomes, :ticket_price, :decimal
    add_column :incomes, :band_end_min, :decimal
    add_column :incomes, :band_end_perc, :decimal
    add_column :incomes, :band_end_dollar, :decimal
    add_column :incomes, :potential_dollar, :decimal
    add_column :incomes, :bonus, :decimal
    add_column :incomes, :bonus_notes, :string
    add_column :incomes, :club_expenses, :decimal
    add_column :incomes, :club_expenses_notes, :string
    add_column :incomes, :merch_income, :decimal
    add_column :incomes, :total_income, :decimal
    add_column :incomes, :other_income, :decimal
    add_column :incomes, :other_expenses, :decimal
    add_column :incomes, :notes, :string
  end
end
