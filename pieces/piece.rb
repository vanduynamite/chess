
class Piece

  attr_writer :position
  attr_reader :color, :inv_color, :board, :position, :selected_color, :back_color

  def initialize(color, board, pos)
    @color = color
    @inv_color = color == :black ? :white : :black
    @selected_color = color == :black ? :red : :green
    @back_color = color == :black ? :black : :white
    @board = board
    @position = pos
    @picked = false
  end

end
