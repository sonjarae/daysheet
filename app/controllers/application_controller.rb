class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #@current_tour = Tour.where( 'tours.end_date BETWEEN ? AND ?', Date.today, 1.month.from_now ).order('start_date DESC').first
    
end
