class DieRandomizer < Randomizer 

  # array holding "enums" or symbols
  $COLOUR = %i[red green blue yellow black white]

  # constructor
  def initialize(sides, colour)
    super(sides)

    if $COLOUR.include?(colour) then
      
      @attribute = colour
    end
  end

  # instance methods
  def hash

    hash = {
      "item"    => :die,
      "up"      => sideup(),
      "count"   => @randomize_count,
      "colour"  => @attribute}
  end 

  def colour

    @attribute
  end 

  def sides

    @size
  end

  def roll

    randomize()
  end

  def sideup
    
    @result
  end

end