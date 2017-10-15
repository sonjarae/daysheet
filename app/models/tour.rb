class Tour < ApplicationRecord
	has_many :users
	has_many :days
	
end
