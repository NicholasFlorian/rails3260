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
      flash[:success] = "Welcome again!"
      store_user requested_user
      redirect_to profile_path 
    else

      # create an error message.
      requested_user = user.where(email: email)
      if requested_user.empty? then

        flash[:error] = "Invalid Email."
      else
    
        flash[:error] = "Invalid Password."
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

    # check information
    if name == "" then

      flash[:error] = "Invalid Name."
      redirect_to register_path 
    end

    if email == "" then

      flash[:error] = "Invalid Email."
      redirect_to register_path 
    end

    if password == "" then

      flash[:error] = "Invalid Password."
      redirect_to register_path 
    end

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

      flash[:success] = "Thanks for signing up!"
      store_user requested_user
      redirect_to profile_path 
    else
      
      # create an error message.
      flash.now[:notice] = "Error"
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

    # get our stored session
    @user = current_user

    # delete and clear the user instance
    @user.destroy
    @user = nil

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

    # get our stored session
    @user = current_user

    # get our coins and dies
    @coins = Coin.where(fk_user_id: @user.id)
    @dies = Die.where(fk_user_id: @user.id)


    # create the player 
    player = Player.new(@user.name)

    # store the items for the player
    for coin in @coins

      player.store(CoinRandomizer.new(coin.denomination))
    end

    for die in @dies 

      player.store(DieRandomizer.new(die.sides, die.colour))
    end 


    # run the turn
    new_points = @user.points 
    new_gems = @user.gems

    player.load({"item" => :die})
    player.load({"item" => :coin})
    player.throw()
    results = player.results({}, 0)
    points = player.sum({})

    # parse the results
    prompt = "The Randomizer Results:\n"
    score = 0

    for result in results
      
      prompt += "<" + result.to_s + ">"
    end

    for point in points

      prompt += "<" + point.to_s + ">"
      
      score += point
    end

    # get the score
    points = score * 100
    gems = score / 5
    gems = gems.floor

    prompt += "Earned #{points} points and #{gems} gems."
    flash[:success] = prompt
    

    # update and return
    new_points += points
    new_gems += gems
    @user.update(points: new_points, gems: new_gems)
    redirect_to game_path
  end
end
