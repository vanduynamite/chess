require 'singleton'

class NullPiece < Piece
  include Singleton

  def moves
    []
  end

  def symbol
    "_"
  end

  def initialize()
    @color = :blue
    @selected_color = :blue
  end

end
