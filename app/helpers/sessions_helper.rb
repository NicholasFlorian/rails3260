module SessionsHelper


  # signs in user
  def store_user(user)

    session[:user_id] = user.id
    @current_user = User.find_by(user.id)
  end


  # gets current user
  def current_user

    @current_user = User.find_by(session[:user_id])
  end
  

  # checks if the user is logged in
  def logged_in?

    !@current_user.nil?
  end
end
