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

  def player1won?
    board[0][0] == 'x' and board[1][0] == 'x' and board[2][0] == 'x'
  end

  private

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end
end
