class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])

      session[:user_id] = @user.id
      redirect_to user_path
    else

      message = "Incorrect UserName or Password"
      redirect_to sign_in_path, notice: message
    end
  end
end