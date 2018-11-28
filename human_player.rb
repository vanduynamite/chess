require_relative 'player'
require 'byebug'

class HumanPlayer < Player

  attr_reader :board

  def take_turn(display)
    @board = display.board
    start_pos = nil

    until start_pos
      response = display.cursor.get_input
      start_pos = get_start_pos
      display.render
    end

    # until piece
    #   piece = is_valid_start_piece(display)
    # end

    # piece.picked = true

    # select that piece
    # @selected_pos = response
    # wait for another input
    # make sure that's valid
    # if it is

  end

  def get_start_pos(board, response)
    board.valid_start_pos?(response) if response.is_a?(Array)
  end

  def valid_piece_color?(piece)

  end



end
