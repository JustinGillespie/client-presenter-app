class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	helper_method :current_user

	def authorize_admin
	  redirect_to dashboard_path if current_user.nil? or current_user.client_id != 0 
	end

	def authorize_client
		id = params[:client_id].nil? ? params[:id].to_i : params[:client_id].to_i
		if current_user.client_id != 0
	  	redirect_to dashboard_path if current_user.nil? or current_user.client_id.to_i != id
		end
	end

	def authorize
	  redirect_to login_url, alert: "Not authorized" if current_user.nil?
	end

end
