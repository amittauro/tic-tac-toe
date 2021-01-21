class TicTacToe

  attr_reader :board, :marker

  def initialize(board)
    @board = board
  end

  def over?(marker)
    @marker = marker
    rows_or_columns? || diagonals? || all_fields_taken?
  end

  private

  def rows_or_columns?
    won = false
    3.times do |i|
      won = true if row_won?(i) || column_won?(i)
    end
    won
  end

  def diagonals?
    (board[0][0] == marker and board[1][1] == marker and board[2][2]) == marker || (
      board[2][0] == marker and board[1][1] == marker and board[0][2] == marker)
  end

  def column_won?(column)
    board[0][column] == marker and board[1][column] == marker and board[2][column] == marker
  end

  def row_won?(row)
    board[row][0] == marker and board[row][1] == marker and board[row][2] == marker
  end

  def all_fields_taken?
    board.flatten.all? { |field| field != nil }
  end
end
