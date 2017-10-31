class AddIdsToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :day_id, :integer
    add_column :tours, :user_id, :integer
    add_column :tours, :income_id, :integer
  end
end
