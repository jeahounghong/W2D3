class Player
    

    def initialize()

    end
    
    def get_move
        p "enter a position with coordinates separate with a space like '4 7' "
        coordinates = gets.chomp.split(" ")
        return coordinates.map {|el| el.to_i}
    end
end
