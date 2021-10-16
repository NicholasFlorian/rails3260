class SessionsController < ApplicationController
  
  # defign our sign in page
  # app/views/sessions/sign_in.html.erb
  def register
  end

  # sign in
  def sign_in

    # were not authenticating, 
    # find the user with the matching email and password
    user = User.find_by(
      email: params[:session][:email],
      password: params[:session][:password]) 
    
    if !!user then
      
      # Log the user in and redirect to the user's show page.
      sign_in user        # app/helpers/session_helper.rb
      redirect_to profile # config/routes
    else

      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
     end
  end

  def sign_out
  end



  # define our user page
  # app/view/sessions/profile.html.erb
  def profile 

    @user = current_user
  end

end
