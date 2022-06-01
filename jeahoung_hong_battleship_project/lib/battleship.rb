require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        p @board.size/4
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        return win? || lose?
    end

    def turn
        attacked = @board.attack(@player.get_move)
        @board.print
        if !attacked
            @remaining_misses -= 1
        end
        p @remaining_misses
    end

end
