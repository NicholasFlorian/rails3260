class SessionsController < ApplicationController
  
  # sign in page
  #
  #

  # GET defign our sign in page
  def register

    if signed_in? then

      @user = current_user
      redirect_to profile_path
    end
  end

  # POST sign in to the app
  def sign_in

    # retreive form
    email = params[:session][:email]
    password = params[:session][:password]

    # were not authenticating, 
    # find the user with the matching email and password
    requested_user = User.where(
      email: email,
      password: password).first
    
    if !!requested_user then
      
      # log the user in and redirect to the user's show page.
      #@user = requested_user
      store_user requested_user
      redirect_to profile_path 
    else

      # create an error message.
      respond_to do |format|
        format.html do
          flash.now[:status_msg] = "Log in failed, incorrect username or password"
          render :contact, locals: { feedback: params }
        end
      end

      # refresh the page
      redirect_to register_path  
    end
  end

  # POST sign up for the app
  def sign_up

    # retreive form
    name = params[:session][:name]
    email = params[:session][:email]
    password = params[:session][:password]

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
      requested_user = User.where(
        email: email,
        password: password).first 

      # on first time sign up add the items 
      for i in 0..2

        coin = Coin.new(
          :fk_user_id => requested_user.id,
          :denomination => 0.25
        )
        coin.save
      end

      die = Die.new(
        :fk_user_id => requested_user.id,
        :colour => "white",
        :sides => 6
      )

      die.save

      store_user requested_user
      redirect_to profile_path 
    else
      
      # create an error message.
      respond_to do |format|
        format.html do
          flash.now[:status_msg] = "Sign in failed (internal error):"
          render :contact, locals: { feedback: params }
        end
      end
    end
  end


  # profile page
  #
  #

  # GET define our user page
  def profile 

    # get our stored session
    @user = current_user

    # get our coins and dies
    @coins = Coin.where(fk_user_id: @user.id)
    @dies = Die.where(fk_user_id: @user.id)
  end

  # DELETE sign out of the app
  def sign_out
    
    # clear the user instance
    @user = nil

    # sign out of the session
    remove_user

    # redirect back to the main page
    redirect_to register_path 
  end

  # DELETE destroy the user and sign out.
  def delete_user

    # delete and clear the user instance
    @user.destroy
    @user = nil

    # sign out of the session
    sign_out

    # redirect back to the main page
    redirect_to register_path 
  end

  # game page
  #
  #

  # GET define our game page
  def game

    # get our stored session
    @user = current_user

    # get our coins and dies
    @coins = Coin.where(fk_user_id: @user.id)
    @dies = Die.where(fk_user_id: @user.id)
  end

  def turn


  end
end
