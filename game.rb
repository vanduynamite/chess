require_relative 'human_player'
require_relative 'display'

class Game

  attr_reader :board, :display, :current_player

  def initialize
    @display = Display.new
    @board = self.display.board
    @players = create_players
    @current_player = :white
  end

  def play

    until false
      display.render
      notify_players
      players[current_player].take_turn(display)
      swap_turns!
    end

  end

  private
  attr_accessor :players
  attr_writer :current_player

  def notify_players
    name = players[current_player].name

    puts "\n\n\nHey #{name}, it's your turn!\n\n\n"
  end

  def swap_turns!
    if self.current_player == :white
      self.current_player = :black
    else
      self.current_player = :white
    end
  end

  def create_players
    players = {
      white: HumanPlayer.new('Li', :white),
      black: HumanPlayer.new('Paul', :black),
    }
  end

end

g = Game.new

g.play
