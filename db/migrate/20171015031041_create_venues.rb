class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      #socials
      t.string :booking_contact
      t.string :production_contact
      t.string :sound_contact

      t.timestamps
    end
  end
end
