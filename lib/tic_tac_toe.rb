class TicTacToe

  attr_reader :board

  def initialize
    @board = create_board
  end

  def player1move(row, column)
    board[row][column] = 'x'
    board
  end

  def player2move(row, column)
    board[row][column] = 'o'
    board
  end

  def won?
    return 'Player1 has won the game' if player1_won?
  end

  def player1_won?
    3.times do |column|
      return true if column_won?(column)
    end
    3.times do |row|
      return true if row_won?(row)
    end
    diagonal_won?
  end

  private

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end

  def column_won?(column)
    board[0][column] == 'x' and board[1][column] == 'x' and board[2][column] == 'x'
  end

  def row_won?(row)
    board[row][0] == 'x' and board[row][1] == 'x' and board[row][2] == 'x'
  end

  def diagonal_won?
    (board[0][0] == 'x' and board[1][1] == 'x' and board[2][2]) == 'x' || (
      board[2][0] == 'x' and board[1][1] == 'x' and board[0][2] == 'x')
  end
end
