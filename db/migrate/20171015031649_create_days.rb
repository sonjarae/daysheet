class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.date :date
      t.integer :show_number
      t.string :show_status
      t.integer :tour_id
      t.integer :venue_id
      t.integer :schedule_id
      t.integer :income_id
      t.timestamps
    end
  end
end
