class Day < ApplicationRecord
	belongs_to :tour
	belongs_to :venue
	has_one :schedule
	has_one :income
end
