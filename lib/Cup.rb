class Cup < RandomizerContainer

    def throw()

        for randomizer in queue

            if randomizer.class == Die then

                randomizer.roll()

            elsif randomizer.class == Coin then

                randomizer.flip()
            else

                randomizer.randomize()
            end 
        end

        Throw.new(self)
    end

    def load(hand)

        if hand.class == Hand then

            move_all(hand)
        end
    end

    def empty()

        hand = Hand.new()
        hand.move_all(self)
        hand
    end
end