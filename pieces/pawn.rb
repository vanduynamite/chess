require 'byebug'

class Pawn < Piece

  def moves
    results = []

    forward_steps.each do |pos|
      test_pos = [position[0] + pos[0] * forward_dir, position[1] + pos[1] * forward_dir]
      results << test_pos
    end

    results + side_attacks
  end

  def symbol
    "♙"
  end

  private

  def forward_steps
    return [[1, 0], [2, 0]] if at_start_row?
    [[1, 0]]
  end

  def forward_dir
    return 1 if color == :black
    return -1 if color == :white
  end

  def at_start_row?
    return true if position[0] == 1 && color == :black
    return true if position[0] == 6 && color == :white
    false
  end

  def side_attacks
    results = []
    possible = [[1, 1], [1, -1]]

    possible.each do |pos|
      test_pos = [position[0] + pos[0] * forward_dir, position[1] + pos[1] * forward_dir]
      results << test_pos if opponent_at_position?(test_pos)
    end

    results
  end

  def opponent_at_position?(pos)
    return false unless board.valid_pos?(pos) # out of bounds
    return true if board[pos].color == self.inv_color
    false
  end

end
