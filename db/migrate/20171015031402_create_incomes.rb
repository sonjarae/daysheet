class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.decimal :guarantee
      t.timestamps
    end
  end
end
