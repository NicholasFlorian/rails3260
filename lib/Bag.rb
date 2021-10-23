class Bag < RandomizerContainer

  # 
  def store(randomizer)

    if randomizer.class.ancestors.include?(Randomizer) then
      randomizer.reset()
      super(randomizer)
    end
  end

  #
  def move_all(randomizerContainer)

    if randomizerContainer.class.ancestors.include?(RandomizerContainer) then
      
      randomizerContainer.reset()
      super(randomizerContainer)
    end
  end

  # select all matching items from hash
  def select(description, amount)

    #TODO test empty descriptsion

    hand = Hand.new()
    found_queue = []
    found = 0
    max_size = 1

    if amount == :all then
      max_size = 0
    else
      max_size = amount
    end
    
    for randomizer in @queue

      if randomizer.contains_hash(description) || description == {} then
        
        hand.store(randomizer)
        found_queue << randomizer
        found = found + 1
        if found == max_size then 
          break
        end
      end
    end

    for randomizer in found_queue 

      @queue.delete(randomizer)
    end

    hand
  end

  def empty()

    hand = Hand.new()
    hand.move_all(self)
    hand
  end
end


