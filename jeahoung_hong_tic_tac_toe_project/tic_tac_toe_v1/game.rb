require_relative "board.rb"
require_relative "human_player.rb"
class Game

    attr_reader :player_1_mark, :player_2_mark, :turn, :current_player

    def initialize(player_1_mark, player_2_mark)
        @turn = 1
        @player_1_mark = player_1_mark
        @player_2_mark = player_2_mark
        @player_1 = HumanPlayer.new(@player_1_mark)
        @player_2 = HumanPlayer.new(@player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        @turn += 1
        @current_player = (@current_player == @player_1) ? @player_2 : @player_1
    end

    def play_game
        while @board.any_empty?
            @board.print
            mark = @current_player.mark_value
            @board.place_mark(@current_player.get_position, @current_player.mark_value)
            if @board.win_col?(mark) || @board.win_row?(mark) || @board.win_diagonal?(mark)
                p "Victory!"
                p @current_player.to_s + " has won!"
                break
            end
            self.switch_turn
        end
        p "Draw"
    end
end

print "Hello Player 1. Please select a mark by typing 1 or 2:\n"
print "    1) O    2) X\n"
mark_1 = gets.chomp.to_i
puts
if mark_1 == 1
    print "Player 1: O, Player 2: X\n"
    game = Game.new(:O, :X)
else
    print "Player 1: X, Player 2: O\n"
    game = Game.new(:X, :O)
end

game.play_game

# p game.current_player
# game.switch_turn
# p game.current_player
# game.switch_turn
# p game.current_player
