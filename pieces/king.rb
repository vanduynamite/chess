require_relative 'stepable'

class King < Piece
  include Stepable

  def move_diffs
    return MOVE_DIFFS
  end

  def symbol
    "♔"
  end

  private

  MOVE_DIFFS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
    [1, 1],
    [-1, -1],
    [1, -1],
    [-1, 1],
  ]

end
