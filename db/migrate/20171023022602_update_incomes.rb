class UpdateIncomes < ActiveRecord::Migration[5.1]
  def change
  	add_column :incomes, :tour_name, :string
    add_column :incomes, :user_id, :integer
    add_column :incomes, :day_id, :integer
  end
end
