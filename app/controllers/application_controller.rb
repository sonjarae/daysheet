class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  	timezone = ActiveSupport::TimeZone[0].name
	DateTime.now.in_time_zone(timezone)
  end

end
