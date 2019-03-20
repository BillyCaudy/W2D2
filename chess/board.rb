require_relative 'piece.rb'
class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)} #2D array
        @sentinel = NullPiece.instance
        fill_rows
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color,start_pos, end_pos)
        begin
            if self[start_pos].is_a?(NullPiece)
                raise NullPieceError, "No piece here!" 
            end
        rescue NullPieceError => exception
            p "#{exception.message}" ; sleep(1)
            return
        end 
        piece = self[start_pos]
        piece_color = piece.color
        begin
            if piece_color != color
                raise WrongColorError, "Wrong Color!"
            end
        rescue WrongColorError => exception
            p "#{exception.message}" ; sleep(1)
            return
        end


        move_piece!(color,start_pos, end_pos)
    end

    def move_piece!(color, start_pos, end_pos)
        self[end_pos] = self[start_pos]   
        self[start_pos] = @sentinel  
        self[end_pos].pos = end_pos    
    end

    def valid_pos?(pos)
        (0..7).include?(pos[0]) && (0..7).include?(pos[1])
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    #private

    def fill_rows
        (0..7).each do |row| 
            (0..7).each do |col| 
                case pos_int = row * 10 + col
                when 0, 7
                    self[[row, col]] = Rook.new(:white,self,[row,col])
                when 1, 6
                    self[[row, col]] = Knight.new(:white,self,[row,col])
                when 2, 5
                    self[[row, col]] = Bishop.new(:white,self,[row,col])
                when 3
                    self[[row, col]] = Queen.new(:white,self,[row,col])
                when 4
                    self[[row, col]] = King.new(:white,self,[row,col])
                when 10, 11, 12, 13, 14, 15, 16, 17
                    self[[row, col]] = Pawn.new(:white,self,[row,col])
                when 20, 21, 22, 23, 24, 25, 26, 27
                    self[[row, col]] = @sentinel
                when 30, 31, 32, 33, 34, 35, 36, 37
                    self[[row, col]] = @sentinel
                when 40, 41, 42, 43, 44, 45, 46, 47
                    self[[row, col]] = @sentinel
                when 50, 51, 52, 53, 54, 55, 56, 57
                    self[[row, col]] = @sentinel
                when 60, 61, 62, 63, 64, 65, 66, 67
                    self[[row, col]] = Pawn.new(:black,self,[row,col])
                when 70, 77
                    self[[row, col]] = Rook.new(:black,self,[row,col])
                when 71, 76
                    self[[row, col]] = Knight.new(:black,self,[row,col])
                when 72, 75
                    self[[row, col]] = Bishop.new(:black,self,[row,col])
                when 73
                    self[[row, col]] = Queen.new(:black,self,[row,col])
                when 74
                    self[[row, col]] = King.new(:black,self,[row,col])
                end
            end
        end
        nil
    end

    def render
        @rows.each do |row|
            row.each do |piece|
                color = piece.color || :nulll
                print "#{color} ".green
            end
            puts
        end
        puts
        nil
    end

end

class NullPieceError < StandardError ; end
class WrongColorError < StandardError ; end
