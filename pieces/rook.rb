require_relative "slideable"

class Rook < Piece
  include Slideable

  def move_dirs
    ORTHO_DIRS
  end

  def symbol
    "♖"
  end

end
