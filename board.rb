require_relative 'pieces/piece_list'

class Board
  attr_reader :null_piece
  attr_accessor :grid

  def initialize()
    @grid = setup_rows
    @null_piece = NullPiece.instance
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    self.rows[row][col] = val
  end

  def valid_pos?(pos)
    return false unless pos[0].between?(0,7)
    return false unless pos[1].between?(0,7)
    true
  end

  def move_piece(start_pos, end_pos)
    # raise error if nullpiece at start_pos
    raise "Invalid position at start pos" if self[start_pos] == null_piece

    # raise error if cannot move to end_pos
    raise "Position out of bounds!" unless valid_pos?(end_pos)

    self[end_pos] = self[start_pos]
    self[end_pos].position = end_pos
    self[start_pos] = null_piece
  end

  def in_check?(color)
    king_pos = find_king(color)
    possible_moves = all_piece_moves(inv_color(color))

    possible_moves.any? do |piece, moves|
      moves.include?(king_pos)
    end
  end

  def find_king(color)
    self.rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        return [i, j] if piece.is_a?(King) && piece.color == color
      end
    end
  end

  def checkmate?(color)
    in_checkmate = true
    possible_moves = all_piece_moves(color)

    possible_moves.each do |piece, moves|
      start_pos = piece.position

      moves.each do |end_pos|
        # we need to make a copy of this current board, move the piece
        ## then see if we're still in check
        board_dup = self.dup
        board_dup.move_piece(start_pos, end_pos)
        in_checkmate = false unless board_dup.in_check?(color)
      end

    end

    in_checkmate
  end

  def dup
    self
  end

private

  def inv_color(color)
    color == :black ? :white : :black
  end

  def all_piece_moves(color)
    possible_moves = {}
    all_pieces(color).each do |piece|
      possible_moves[piece] = piece.moves
    end
    possible_moves
  end

  def all_pieces(color)
    self.rows.flatten.select {|piece| piece.color == color}
  end

  def setup_rows

    [
      [ Rook.new(:black, self, [0, 0]),
        Knight.new(:black, self, [0, 1]),
        Bishop.new(:black, self, [0, 2]),
        Queen.new(:black, self, [0, 3]),
        King.new(:black, self, [0, 4]),
        Bishop.new(:black, self, [0, 5]),
        Knight.new(:black, self, [0, 6]),
        Rook.new(:black, self, [0, 7]),
      ],
      [ Pawn.new(:black, self, [1, 0]),
        Pawn.new(:black, self, [1, 1]),
        Pawn.new(:black, self, [1, 2]),
        Pawn.new(:black, self, [1, 3]),
        Pawn.new(:black, self, [1, 4]),
        Pawn.new(:black, self, [1, 5]),
        Pawn.new(:black, self, [1, 6]),
        Pawn.new(:black, self, [1, 7]),
      ],
      Array.new(8, NullPiece.instance),
      Array.new(8, NullPiece.instance),
      Array.new(8, NullPiece.instance),
      Array.new(8, NullPiece.instance),
      [ Pawn.new(:white, self, [6, 0]),
        Pawn.new(:white, self, [6, 1]),
        Pawn.new(:white, self, [6, 2]),
        Pawn.new(:white, self, [6, 3]),
        Pawn.new(:white, self, [6, 4]),
        Pawn.new(:white, self, [6, 5]),
        Pawn.new(:white, self, [6, 6]),
        Pawn.new(:white, self, [6, 7]),
      ],
      [ Rook.new(:white, self, [7, 0]),
        Knight.new(:white, self, [7, 1]),
        Bishop.new(:white, self, [7, 2]),
        Queen.new(:white, self, [7, 3]),
        King.new(:white, self, [7, 4]),
        Bishop.new(:white, self, [7, 5]),
        Knight.new(:white, self, [7, 6]),
        Rook.new(:white, self, [7, 7]),
      ]
    ]

  end

  REGULAR_GAME = [
    [ Rook.new(:black, self, [0, 0]),
      Knight.new(:black, self, [0, 1]),
      Bishop.new(:black, self, [0, 2]),
      Queen.new(:black, self, [0, 3]),
      King.new(:black, self, [0, 4]),
      Bishop.new(:black, self, [0, 5]),
      Knight.new(:black, self, [0, 6]),
      Rook.new(:black, self, [0, 7]),
    ],
    (0..7).to_a.map { |col| Pawn.new(:black, self, [1, col])},
    Array.new(8, NullPiece.instance),
    Array.new(8, NullPiece.instance),
    Array.new(8, NullPiece.instance),
    Array.new(8, NullPiece.instance),
    (0..7).to_a.map { |col| Pawn.new(:white, self, [6, col])},
    [ Rook.new(:white, self, [7, 0]),
      Knight.new(:white, self, [7, 1]),
      Bishop.new(:white, self, [7, 2]),
      Queen.new(:white, self, [7, 3]),
      King.new(:white, self, [7, 4]),
      Bishop.new(:white, self, [7, 5]),
      Knight.new(:white, self, [7, 6]),
      Rook.new(:white, self, [7, 7]),
    ]
  ]

end
