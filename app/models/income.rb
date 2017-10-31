class Income < ApplicationRecord
	#attr_accessible :tour_name, :day_id
	belongs_to :day
end
