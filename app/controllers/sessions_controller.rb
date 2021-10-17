class SessionsController < ApplicationController
  
  # GET defign our sign in page
  # app/views/sessions/sign_in.html.erb
  def register
  end


  # POST sign in to the app
  def sign_in

    # were not authenticating, 
    # find the user with the matching email and password
    requested_user = User.find_by(
      email: params[:session][:email],
      password: params[:session][:password]) 
    
    if !!requested_user then
      
      # log the user in and redirect to the user's show page.
      @user = requested_user
      redirect_to profile_path 
    else

      # create an error message.
      #redirect_to :back
     end
  end


  # POST sign up for the app
  def sign_up

    # TODO Passowrd confirmation check

    # create our new user 
    submitted_user = User.new(params)

    # store it in the datebase and log in
    respond_to do |format|
      
      if submitted_user.save

        # log the user into the system
        #redirect_to :back
      else
        
        # create an error message.
        #redirect_to :back
      end
    end
  end


  # DELETE sign out of the app
  def sign_out
  end


  # GET define our user page
  # app/view/sessions/profile.html.erb
  def profile 
  end

end
