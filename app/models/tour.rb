class Tour < ApplicationRecord
	has_many :users
	has_many :days
	has_many :incomes
	has_many :schedules
end
