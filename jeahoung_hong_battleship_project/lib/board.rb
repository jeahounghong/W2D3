require "byebug"

class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def [](position)
        return @grid[position[0]][position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |el|
            el.each do |i|
                count += 1 if i == :S
            end
        end
        count
    end

    def attack(position)
        #debugger
        val = [](position)
        if val == :S
            []=(position) = :H
            p "you sunk my battleship!"
            return true
        else
            Board[position] = :X
            return false
            # []=(position)
        end
    end
end

# bd = Board.new(4)
# bd.attack([1,1])