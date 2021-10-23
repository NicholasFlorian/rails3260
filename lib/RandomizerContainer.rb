class RandomizerContainer
  attr_reader :queue

  # constructor
  def initialize()
 
    @queue = [] # initilize the queue
  end

  # class methods
  def store(randomizer)

    if randomizer.class.ancestors.include?(Randomizer) then
      @queue << randomizer
    end
  end

  def move_all(randomizerContainer) 
    
    if randomizerContainer.class.ancestors.include?(RandomizerContainer) then

      @queue = @queue + randomizerContainer.queue
      randomizerContainer.queue().clear()
    end
  end

  def empty()

    @queue.clear()
  end

  def reset()

    for randomizer in @queue
      randomizer.reset()
    end
  end
end