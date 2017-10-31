class Day < ApplicationRecord
	has_one :income
	has_many :schedule
	belongs_to :tour
	belongs_to :venue
end
