class Day < ApplicationRecord
	has_many :schedule
	belongs_to :tour
end
