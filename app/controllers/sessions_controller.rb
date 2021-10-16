class SessionsController < ApplicationController
  
  # GET defign our sign in page
  # app/views/sessions/sign_in.html.erb
  def register
  end


  # POST sign in to the app
  def sign_in

    # were not authenticating, 
    # find the user with the matching email and password
    user = User.find_by(
      #params[:session][]
      email: params[:email],
      password: params[:password]) 

    puts user.inspect()
    flash.now[:danger] = user.inspect()
    
    if !!user then
      
      # Log the user in and redirect to the user's show page.
      sign_in user         # app/helpers/session_helper.rb
      redirect_to profile  # config/routes
    else

      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
     end
  end

  # DELETE sign out of the app
  def sign_out
  end



  # GET define our user page
  # app/view/sessions/profile.html.erb
  def profile 

    @user = current_user
  end

end
