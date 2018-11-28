require_relative 'slideable'

class Queen < Piece
  include Slideable

  def move_dirs
    ORTHO_DIRS + DIAG_DIRS
  end

  def symbol
    "♕"
  end

end
