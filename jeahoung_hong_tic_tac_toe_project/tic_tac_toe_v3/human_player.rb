require_relative "board.rb"

class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value

    end

    def get_position(legal_positions)
        begin
            print "Player: " + @mark_value.to_s + "\n"
            puts "Please enter a position in the form '1 2' where the numbers are separated by a space"
            coordinates = gets.chomp.split(" ")
            # p coordinates
            

            unless coordinates.length == 2
                print "---You inserted the wrong number of spaces\n"
                raise ArgumentError.new "Please insert a single space"
            end
            integer_check = true
            coordinates.each do |el|
                integer_check = false if el.to_i.to_s != el
            end
            unless integer_check
                print "---Please enter only numbers\n"
                raise ArgumentError.new "Please enter only numbers"
            end

            unless legal_positions.include?(coordinates.map {|el| el.to_i})
                print "---You entered an invalid position\n"
                raise ArgumentError.new "This is not a valid position"
            end
        rescue ArgumentError
            print "---Please enter a valid position in the right format\n"
            retry
        end

        return coordinates.map {|el| el.to_i}
    # rescue #ArgumentError.new => e
    #     p "Please enter a valid position in the right format"
    #     retry
    end

end

# h = HumanPlayer.new(:X)

# p h.get_position