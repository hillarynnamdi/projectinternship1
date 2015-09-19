class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
 

private 
	def current_user
		@current_user||= Users.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
end


private 
	def require_login
		if session[:user_id].nil?
			redirect_to login_index_path
			flash[:loginflash]="you cannot access the page unless you're logged in"
		end
	end
