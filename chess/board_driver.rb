require_relative 'board.rb'
require_relative 'display.rb'
require 'colorize' #makes our method board.render work

board = Board.new
#board.fill_rows
display = Display.new(board)
move_store = []
while true
    system("clear")
    display.render
    start_pos = display.cursor.cursor_pos
    puts "Enter new position with arrows"
    move = display.cursor.get_input
        if move == :return
        move_store << display.cursor.cursor_pos
            if move_store.length > 1
                board.move_piece(:white,move_store.first,move_store.last)
                move_store = []
            end
        end
        
    end_pos = display.cursor.cursor_pos
end
# new_board.fill_rows

# new_board.render

# new_board.move_piece(:yellow,[2,0],[2,1])

# new_board.move_piece(:yellow,[0,0],[2,0])

# new_board.render

# new_board.move_piece(:yellow,[2,0],[7,7])

# new_board.render
