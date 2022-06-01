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
        val = self[position]
        if val == :S
            self[position] = :H
            p "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
            # []=(position)
        end
    end

    def place_random_ships
        arr = [*1..@size]
        arr_random = arr.sample(@size/4)
        @grid.each_with_index do |el,i|
            el.each_with_index do |el2, j|
                num = i*el.length + j + 1
                @grid[i][j] = :S if arr_random.include?(num)
            end
        end
    end

    def hidden_ships_grid
        return @grid.map do |el|
            el.map do |el2|
                if el2 == :S
                    :N
                else
                    el2
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |el|
            puts el.join(" ")
            #REGEX
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


end

# arr = [[1,2],[1,2]]
# p arr.map {|el| el.map {|el2| :N}}
