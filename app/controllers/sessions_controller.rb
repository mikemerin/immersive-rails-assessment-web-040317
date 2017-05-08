class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if user_valid?(@user, params[:username][:password_digest])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:notice] = "We couldn't find your username and/or password, try again."
      redirect_to login_path
    end

    def destroy
      session[:user_id] = nil
      redirect_to login_path
    end
  end

end
