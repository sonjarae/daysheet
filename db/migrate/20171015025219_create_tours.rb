class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.datetime :available_since
      t.boolean :active
      t.binary :image
      t.user_id :booking_agent

      t.timestamps
    end
  end
end
