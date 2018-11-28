
module Slideable

  def moves
    possible_moves = []

    move_dirs.each do |dir|
      possible_moves += get_unblocked_moves_in_dir(dir)
    end

    possible_moves
  end

  def get_unblocked_moves_in_dir(dir)
    # return an array of all possible positions that are not blocked
    ## i.e. that don't have our own piece in the way
    ## OR one beyond an enemy piece
    results = []
    test_pos = [position[0]+dir[0], position[1]+dir[1]]
    other_piece_hit = false

    while pos_empty?(test_pos) && !other_piece_hit
      results << test_pos.dup
      other_piece_hit = true if board[test_pos].color == inv_color
      test_pos[0] += dir[0]
      test_pos[1] += dir[1]
    end

    results
  end

  def orthogonal_dirs
    ORTHO_DIRS
  end

  def diagonal_dirs
    DIAG_DIRS
  end

  private
  ORTHO_DIRS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
  ]

  DIAG_DIRS = [
    [-1, 1],
    [-1, -1],
    [1, 1],
    [1, -1],
  ]

  def pos_empty?(pos)
    return false unless board.valid_pos?(pos) # out of bounds
    return false if board[pos].color == self.color
    true
  end

end
