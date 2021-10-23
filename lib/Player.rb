class Player
    attr_reader :name
    attr_reader :bag
    attr_reader :cup


    def initialize(name)

        @name = name
        @bag = Bag.new()
        @cup = Cup.new()
        @throws = []
    end

    def store(randomizer)

        @bag.store(randomizer)
    end

    def move_all(randomizerContainer)

        @bag.move_all(randomizerContainer)
    end

    def load(description)

        @cup.load(@bag.select(description, :all))
    end

    def throw()

        temp = @cup.throw()
        @throws.unshift(temp)

        bag.move_all(@cup.empty())
        return temp
    end

    def clear()

        @throws.clear()
    end

    def tally(description)

        final_tally = []

        for cur in @throws 

            final_tally << cur.description(description).tally()
        end

        return final_tally
    end

    def sum(description)

        final_sum = []

        for cur in @throws 

            final_sum << cur.description(description).sum()
        end

        return final_sum
    end

    def results(description, position)

        @throws[position].description(description).results()
    end
end