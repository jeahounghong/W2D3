require_relative "board.rb"

class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value

    end

    def get_position
        
        print "Player: " + @mark_value.to_s + "\n"
        puts "Please enter a position in the form '1 2' where the numbers are separated by a space"
        coordinates = gets.chomp.split(" ")
        # p coordinates
        unless coordinates.length == 2
            raise ArgumentError.new "Please insert a single space"
        end
        integer_check = true
        coordinates.each do |el|
            integer_check = false if el.to_i.to_s != el
        end
        unless integer_check
            raise ArgumentError.new "Please enter only numbers"
        end

        return coordinates.map {|el| el.to_i}
    end

end

# h = HumanPlayer.new(:X)

# p h.get_position