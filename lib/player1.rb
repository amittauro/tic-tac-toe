class Player1

  attr_reader :board

  def won?(board)
    @board = board
    any_column_won? || any_row_won? || any_diagonal_won?
  end

  private

  def any_column_won?
    won = false
    3.times do |column|
      won = true if column_won?(column)
    end
    won
  end

  def any_row_won?
    won = false
    3.times do |row|
      won = true if row_won?(row)
    end
    won
  end

  def any_diagonal_won?
    (board[0][0] == 'x' and board[1][1] == 'x' and board[2][2]) == 'x' || (
      board[2][0] == 'x' and board[1][1] == 'x' and board[0][2] == 'x')
  end

  def column_won?(column)
    board[0][column] == 'x' and board[1][column] == 'x' and board[2][column] == 'x'
  end

  def row_won?(row)
    board[row][0] == 'x' and board[row][1] == 'x' and board[row][2] == 'x'
  end
end
