require_relative 'stepable'

class Knight < Piece
  include Stepable

  def move_diffs
    return MOVE_DIFFS
  end

  def symbol
    "♘"
  end

  private

  MOVE_DIFFS = [
    [2, 1],
    [2, -1],
    [1, -2],
    [-1, -2],
    [-2, -1],
    [-2, 1],
    [-1, 2],
    [1, 2],
  ]

end
