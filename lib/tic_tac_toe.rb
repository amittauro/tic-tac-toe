class TicTacToe

  def initialize(display = Display.new)
    @board = create_board
    @display = display
  end

  def move(input, marker)
    update_board(input, marker)
    @display.print(@board)
  end

  def field_free?(input)
    @board[x(input)][y(input)] == nil
  end

  def over?(marker)
    rows_or_columns?(marker) || diagonals?(marker) || all_fields_taken?
  end

  private

  attr_reader :board

  def x(input)
    input[0].to_i
  end

  def y(input)
    input[2].to_i
  end

  def update_board(input, marker)
    board[x(input)][y(input)] = marker
  end

  def rows_or_columns?(marker)
    3.times do |i|
      return true if row_won?(i, marker) || column_won?(i, marker)
    end
    false
  end

  def diagonals?(marker)
    (board[0][0] == marker and board[1][1] == marker and board[2][2]) == marker || (
      board[2][0] == marker and board[1][1] == marker and board[0][2] == marker)
  end

  def column_won?(column, marker)
    board[0][column] == marker and board[1][column] == marker and board[2][column] == marker
  end

  def row_won?(row, marker)
    board[row] == [marker, marker, marker]
  end

  def all_fields_taken?
    board.flatten.all? { |field| field != nil }
  end

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end
end
