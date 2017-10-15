class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :load_in_time

      t.timestamps
    end
  end
end
