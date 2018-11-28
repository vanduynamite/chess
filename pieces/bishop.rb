require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def move_dirs
    DIAG_DIRS
  end

  def symbol
    "♗"
  end

end
