class SessionsController < ApplicationController
  
  # defign our sign in page
  # app/views/sessions/sign_in.html.erb
  def sign_in
  end

  # sign in
  def create

    # were not authenticating, 
    # find the user with the matching email and password
    user = User.find_by(
      email: params[:session][:email].downcase,
      password: params[:session][:password]) 
    
    if !!user then
      
      # Log the user in and redirect to the user's show page.
      log_in user       # app/helpers/session_helper.rb
      redirect_to user  #
    else

      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
     end
  end

  def destroy
  end

  # define our user page
  # app/view/sessions/sign_in.html.erb
  def user 
    
    # session->:user_id is assigned in app/helpers/session_helper.rb
    user = session[:user_id]
  end

end
