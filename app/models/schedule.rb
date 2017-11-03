class Schedule < ApplicationRecord
	belongs_to :day
	belongs_to :tour
	has_one :income
end
