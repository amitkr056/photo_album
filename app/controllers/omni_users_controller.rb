class OmniUsersController < ApplicationController

	def index
		@omniauth_users = current_user.omniauth_users if current_user
	end

	def create
		p "<<<<<<<<<<<<create>>>>>>>>>>>>>>>>>"
		omniauth_user = current_user.omniauth_users.from_omniauth(env["omniauth.auth"])
		session[:omniauth_user_id] = omniauth_user.id
		flash[:notice] = "User Signed-in through facebook successfully."
		redirect_to omni_users_path
	end

	def destroy
		@omniauth_user = current_user.omniauth_users.find(params[:id])
		@omniauth_user.destroy
		flash[:notice] = "Omniauth User Record deleted."
		redirect_to omni_users_path
	end

end