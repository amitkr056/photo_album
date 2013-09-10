class SessionsController < ApplicationController
	
	def destroy
		session[:omniauth_user_id] = nil
		flash[:notice] = "Omniauth User Signed out from facebook account."
		redirect_to root_path
	end
end