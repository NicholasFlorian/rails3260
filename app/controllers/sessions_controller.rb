class SessionsController < ApplicationController
  
  # GET defign our sign in page
  # app/views/sessions/sign_in.html.erb
  def register

    if logged_in? then

      @user = current_user
      redirect_to profile_path
    end
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
      #@user = requested_user
      store_user requested_user
      redirect_to profile_path 
    else

      # create an error message.
      redirect_to register_path
     end
  end


  # POST sign up for the app
  def sign_up

    name = params[:session][:name]
    email = params[:session][:email]
    password = params[:session][:password]
    # TODO, CHECK!

    # create our new user 
    submitted_user = User.new(
      :name => name,
      :email => email,
      :password => password,
      :points => 0,
      :gems => 0
    )

    # store it in the datebase and log in
    if submitted_user.save

      # log the user into the system
      #redirect_to
      flash[:alert] = "User Added"
    else
      
      # create an error message.
      #redirect_to
      flash[:alert] = "User Not Added"
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
