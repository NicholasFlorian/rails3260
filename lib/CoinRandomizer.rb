class CoinRandomizer < Randomizer

  # array holding "enums" or symbols
  $DENOMINATION = [0.05, 0.10, 0.25, 1, 2]
  $COIN_SIDE = %i[T H]

  # constructor
  def initialize(denomination) 
    super(2)

    if $DENOMINATION.include?(denomination) then

      @attribute = denomination
    end
  end

  # instance methods
  def hash()

    hash = {
      "item"          => :coin,
      "up"            => sideup(),
      "count"         => @randomize_count,
      "denomination"  => @attribute}
  end 
  
  def denomination()

    @attribute 
  end

  def randomize()
    @result = rand(@size)

  end

  def flip()

    randomize()
    self
  end

  def sideup()

    if result() != nil then 
      $COIN_SIDE[@result] # returns 1 for :H, 2 for :T
    end 
  end
end