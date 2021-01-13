class Player2

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
    (board[0][0] == 'o' and board[1][1] == 'o' and board[2][2]) == 'o' || (
      board[2][0] == 'o' and board[1][1] == 'o' and board[0][2] == 'o')
  end

  def column_won?(column)
    board[0][column] == 'o' and board[1][column] == 'o' and board[2][column] == 'o'
  end

  def row_won?(row)
    board[row][0] == 'o' and board[row][1] == 'o' and board[row][2] == 'o'
  end
end
