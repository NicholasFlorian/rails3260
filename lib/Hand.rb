class Hand < RandomizerContainer

    def next

        @queue.pop
    end

    def empty 
        super()
        nil
    end
end