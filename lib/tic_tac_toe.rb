class TicTacToe

  attr_reader :board, :moves, :player1, :player2

  def initialize(player1 = Player1.new, player2 = Player2.new)
    @player1 = player1
    @player2 = player2
    @board = create_board
    @moves = 0
  end

  def player1move(row, column)
    @moves += 1
    board[row][column] = 'x'
    board
  end

  def player2move(row, column)
    @moves += 1
    board[row][column] = 'o'
    board
  end

  def won
    if player1.won?(board)
      result = 'Player1 has won the game'
    elsif player2.won?(board)
      result = 'Player2 has won the game'
    end
    result
  end

  def over
    return 'the game is over' if moves == 9
  end

  private

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end
end
