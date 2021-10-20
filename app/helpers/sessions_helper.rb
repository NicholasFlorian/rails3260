module SessionsHelper

  # sign in user into the seesion
  def store_user(user)

    session[:user_id] = user.id
    @current_user = User.find_by(id: user.id)
  end

  # gets current user in the session
  def current_user

    @current_user = User.find_by(id: session[:user_id])
  end
  
  # checks if the user is logged in
  def signed_in?

    !@current_user.nil?
  end

  # sign the user out of the seesion
  def sign_out
    
    session[:user_id] = nil
  end
end
