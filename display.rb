require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'

class Display

  attr_reader :board, :cursor

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([7,0], board)
  end

  def render
    puts "  #{DUBSP}A#{DUBSP}B#{DUBSP}C#{DUBSP}D#{DUBSP}E#{DUBSP}F#{DUBSP}G#{DUBSP}H\n\n"

    board.grid.each_with_index do |row, i|
      LINES.times {puts "  #{SPACER}#{empty_row(i)}\n"}
      print "#{8 - i} #{SPACER}"

      row.each_with_index do |piece, j|
        print build_output(piece, [i, j])
      end
      puts "\n"
      LINES.times {print "  #{SPACER}#{empty_row(i)}\n"}
    end
    nil

  end

  private

  def empty_row(row_num)
    b_sq = "#{SPACER} #{SPACER}".on_light_black
    w_sq = "#{SPACER} #{SPACER}".on_light_white

    return w_sq + b_sq + w_sq + b_sq + w_sq + b_sq + w_sq + b_sq if row_num.even?
    return b_sq + w_sq + b_sq + w_sq + b_sq + w_sq + b_sq + w_sq if row_num.odd?
  end

  def build_output(piece, pos)
    i = pos[0]
    j = pos[1]

    # basic piece symbol
    output = "#{SPACER}#{piece.symbol}#{SPACER}"

    # set basic color
    output = output.colorize(piece.color)

    # if cursor is on this square, color differently
    output = output.colorize(piece.selected_color) if [i, j] == cursor.cursor_pos

    # change nullpiece output to " " if it's not selected
    output = "#{SPACER} #{SPACER}" if piece == NullPiece.instance && [i,j] != cursor.cursor_pos

    # color the background according to the position it's on
    output = output.on_light_white if (i + j).even?
    output = output.on_light_black if (i + j).odd?

    output
  end

  SPACER = "    "
  DUBSP = SPACER + SPACER
  LINES = 2

end

d = Display.new()

d.render
