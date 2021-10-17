module SessionsHelper


  # signs in user
  def store_user(user)

    session[:user_id] = user.id
    @current_user ||= User.find_by(user.id)
  end


  # gets current user
  def current_user

    if session[:user_id] then

      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  

  # checks if the user is logged in
  def logged_in?

    !@current_user.nil?
  end
end
