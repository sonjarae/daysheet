class UpdateDays < ActiveRecord::Migration[5.1]
  def change
  	add_column :days, :guest_list, :string
  end
end
