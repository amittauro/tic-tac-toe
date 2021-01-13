class TicTacToe

  def initialize
    @board = create_board
  end

  def player1move(row, column)
    @board[row][column] = 'x'
    @board
  end

  private

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end
end
