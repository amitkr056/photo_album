class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def omniauth_user
  	@omniauth_user = current_user.omniauth_users.find(session[:omniauth_user_id]) if session[:omniauth_user_id]
  end

  helper_method :omniauth_user
end
