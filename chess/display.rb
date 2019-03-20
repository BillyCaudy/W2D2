require_relative 'cursor.rb'
require 'colorize'
require 'byebug'

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board) 
    end

    def render
        color_idx = 0
        @board.rows.each.with_index do |row, ridx|
        #(0..7).to_a.reverse.each do |ridx|
            #row = @board.rows[ridx]
            print "#{ridx + 1}\s"
            #print "#{@board.rows.length - ridx}\s"
            row.each.with_index do |piece, cidx|     
                color = piece.color
                sym = color == :white ? piece.symbol.white : piece.symbol.black
                if [ridx,cidx] == @cursor.cursor_pos
                    print piece.symbol.red.colorize(background: :yellow)
                elsif color_idx.even?
                    print sym.colorize(background: :blue)
                else
                    print sym.colorize(background: :cyan)
                end
                color_idx += 1
            end
            color_idx += 1
            puts
        end
        print "\s\s\s"
        print ("A".."H").to_a.join("  ")
        puts
        nil
    end
end  