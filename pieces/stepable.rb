module Stepable

  def moves
    possible_moves = []

    move_diffs.each do |diff|
      test_pos = [position[0] + diff[0], position[1] + diff[1]]
      possible_moves << test_pos if pos_empty?(test_pos)
    end

    possible_moves
  end

  private

  def pos_empty?(pos)
    return false unless board.valid_pos?(pos) # out of bounds
    return false if board[pos].color == self.color
    true
  end

end
