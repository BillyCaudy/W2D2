require 'singleton'

class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color #symbol
        @board = board #Board class
        @pos = pos #Array
    end


    def to_s
        " * "
    end

    def inspect
     "object:#{self.object_id} color:#{@color} pos:#{@pos}"
    end

    def empty?
    end

    def valid_moves
        self.move_dirs
    end

    def pos=(val)
        @pos = val #checked valid_pos? above ???
    end

    def symbol
        " * "
    end

    private

    def move_into_check?(end_pos)
    end
    
end


class NullPiece < Piece
    
    include Singleton

    def initialize
    end

    def moves
    end

    def symbol
        "   "
    end

    def to_s
        "   "
    end
end

class Pawn < Piece

    def symbol
        " ♙ "
    end

    def move_dirs
    end

    def at_start_row?
        return true if @pos[0] == 1 && @color == :white
        return true if @pos[6] == 1 && @color == :black
    end

    def forward_dir #return 1 or -1

    end

    def forward_steps

    end

    def side_attacks

    end

end

module Slideable
    
    def horizontal_dirs
    end
    
    def diagonal_dirs
    end

    def moves
    end
    private
    HORIZONTAL_DIRS = []
    DIAGONAL_DIRS = []

    def move_drs()
    end

    def grow_unblocked_moves_in_fir(dx, dy)
    end
end

class Rook < Piece
    include Slideable

    def symbol
        " ♖ "
    end

    protected
    def move_dirs
    end
end

class Bishop < Piece
    include Slideable

    def symbol
        " ♗ "
    end

    protected
    def move_dirs
    end
end

class Queen < Piece
    include Slideable

    def symbol
        " ♕ "
    end

    protected
    def move_dirs
    end
end

module Stepable
    
    def moves
    end
    private
    
    def move_diffs()
    end

end

class Knight < Piece
    include Slideable

    def symbol
        " ♘ "
    end

    protected
    def move_dirs
    end
end

class King < Piece
    include Stepable

    def symbol
        " ♔ "
    end

    protected
    def move_dirs
    end
end
