class Board

    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, '_')}
    end

    def [](position)
        return @grid[position[0]][ position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def valid?(position)
        return false if position.length != 2
        return false if position[0] >= @grid.length || position[0] < 0
        return false if position[1] >= @grid.length || position[1] < 0
        true
    end

    def empty?(position)
        # p self[position]
        #p "yes" if self[position] == '_'
        return self[position] == '_'
    end

    def legal_positions?
        arr = []
        @grid.each_with_index do |el, i|
            el.each_with_index do |el2, j|
                arr << [i,j] if self.empty?([i,j])
            end
        end
        arr
    end

    def any_empty?
        @grid.each do |el|
            el.each do |i|
                return true if i == '_'
            end
        end
        false
    end

    def place_mark(position, mark)
        unless valid?(position)
            raise ArgumentError.new "You are out of bounds"
        end
        unless empty?(position)
            raise ArgumentError.new "That spot is taken"
        end

        self[position] = mark
    end

    def print
        @grid.each do |el|
            puts el.join(" ")
        end
    end

    def win_row?(mark)
        won = false
        @grid.each_with_index do |el,i|
            won = true if el.all? {|r| r == mark}
        end
        won
    end

    def win_col?(mark)
        won = false
        @grid.each_with_index do |el,j|
            column = true
            @grid[0].each_with_index do |el2,i|
                column = false if @grid[i][j] != mark
            end
            won = true if column
        end
        won
    end

    def win_diagonal?(mark)

        #right-down diagonal
        right_down = true
        right_up = true
        (0..@grid.length-1).each do |i|
            right_down = false if @grid[i][i] != mark
            right_up = false if @grid[@grid.length-1-i][i] != mark
        end
        return right_down || right_up
    end

end

# b = Board.new
# p b.grid
# b[[1,0]] = :O
# p b.grid
# # p b[[1,1]]
# # b.empty?([-1,1])
# # p b.win_row?(:X)
# # p b.win_row?('_')
# # p b.win_col?(:X)
# # p b.win_col?('_')
# # p b. win_diagonal?(:X)
# # p b. win_diagonal?('_')
# b.place_mark([1,1], :X)
# p "Placed :X in center"
# b.print

