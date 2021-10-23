class Randomizer

  attr_reader :result 
  attr_reader :randomize_count
  attr_reader :attribute

  # array holding our valid "enums"
  $ITEMS = %i[coin die]


  # constructor
  def initialize(size) 

    @size = size
    @attribute = nil
    reset()
  end

  # instance methods
  def hash

    hash = {
      "item"      => :randomizer,
      "result"    => @result,
      "count"     => @randomize_count,
      "attribute" => @attribute}
  end 

  def contains_hash(hash)

    self_hash = self.hash()

    for key in hash.keys()

      if self_hash[key] != hash[key] then
        return false
      end
    end

    return true
  end

  def reset
    
    @randomize_count = 0
    @result = nil
  end

  def randomize

    @result = rand(@size) + 1
    @randomize_count = @randomize_count + 1

    # return self for method chaining 
    self
  end 
end 