require_relative 'board.rb'
require_relative 'display.rb'

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {}
        @current_player = :white        
    end

    def play
        move_store = []
        while true
            system("clear")
            @display.render
            start_pos = @display.cursor.cursor_pos
            puts "Enter new position with arrows"
            move = @display.cursor.get_input
            if move == :return
                move_store << @display.cursor.cursor_pos
                if move_store.length > 1
                    @board.move_piece(:white,move_store.first,move_store.last)
                    move_store = []
                end
            end  
            end_pos = @display.cursor.cursor_pos
        end
    end
    
    def notify_players
    end

    def swap_turn!
    end

end