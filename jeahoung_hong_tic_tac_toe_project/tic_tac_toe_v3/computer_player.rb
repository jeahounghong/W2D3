require_relative "board.rb"

class ComputerPlayer
    
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        print "Bot " + @mark_value.to_s + " is thinking...\n"
        return legal_positions.sample
    end
end