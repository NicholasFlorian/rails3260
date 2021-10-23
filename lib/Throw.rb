class Throw
  attr_reader :results
  attr_reader :tally
  attr_reader :sum
  
  def initialize(cup)

    @queue = []
  

    if cup.class() == Cup then

      for randomizer in cup.queue

        @queue << randomizer.dup()
      end
    end 

    @results = []
    @tally = 0
    @sum = 0
    description({})
  end

  def description(description)

    @results.clear()
    @tally = 0
    @sum = 0

    for randomizer in @queue

      if randomizer.contains_hash(description) || description == {} then

        @results << randomizer.sideup()
        @tally = @tally + 1

        if randomizer.result() !=  nil then 
          @sum = @sum + randomizer.result()
        end
      end
    end

    self
  end
end