require_relative 'player'

class HumanPlayer < Player

  def take_turn(display)

    response = display.cursor.get_input

    if response.is_a?(Array)
      # make sure it's a valid piece
      # select that piece
      # @selected_pos = response
      # wait for another input
      # make sure that's valid
      # if it is
    end

  end

end
