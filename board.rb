require_relative 'pieces/piece_list'

class Board

  attr_reader :grid

  def initialize()
    @null_piece = NullPiece.instance
    @grid = new_grid
  end

  def move_piece(start_pos, end_pos)

  end

  private

  def new_grid()
    grid = Array.new(8) { Array.new(8, @null_piece) }
    # [1, 6].each do |row|
    #   grid[row].each_with_index { |el, i| grid[row][i] = 'P' }
    # end
    grid
  end

end
