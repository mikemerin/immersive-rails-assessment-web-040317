class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_valid?(username, password_digest)
    username.try(:authenticate, password_digest)
  end

end
