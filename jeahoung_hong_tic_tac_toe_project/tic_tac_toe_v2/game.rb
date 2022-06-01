require_relative "board.rb"
require_relative "human_player.rb"
class Game

    attr_reader :turn, :current_player

    def initialize(size = 3, player_marks )
        @turn = 0
        @players = []
        player_marks.each do |el|
            @players << HumanPlayer.new(el)
        end
        # @player_1_mark = player_1_mark
        # @player_2_mark = player_2_mark
        # @player_1 = HumanPlayer.new(@player_1_mark)
        # @player_2 = HumanPlayer.new(@player_2_mark)
        @board = Board.new(size)
        @current_player = @players[0]
    end

    def switch_turn
        @turn += 1
        @current_player = @players[@turn % @players.length]
    end

    def play_game
        while @board.any_empty?
            puts
            print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
            @board.print
            puts
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

print "Hello! How many players would you like to have play?\n"
num_players = gets.chomp.to_i
player_marks = []
(1..num_players).each do |el|
    print "Please provide a single character 'mark' for Player " + el.to_s + "\n"
    player_marks << gets.chomp
    puts
end

print "Please select a size n of the grid: n x n\n"
size = gets.chomp.to_i
puts

print "Players:\n"
player_marks.each_with_index do |el,i|
    p "\t Player " + (i+1).to_s + ": " + el.to_s 
end
game = Game.new(size, player_marks)
game.play_game


# if mark_1 == 1
#     print "Player 1: O, Player 2: X\n"
#     game = Game.new(:O, :X, size)
# else
#     print "Player 1: X, Player 2: O\n"
#     game = Game.new(:X, :O)
# end



# p game.current_player
# game.switch_turn
# p game.current_player
# game.switch_turn
# p game.current_player
