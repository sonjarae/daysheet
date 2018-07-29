class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.search(search)
    where("name LIKE ? OR city LIKE ? OR notes LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
end
