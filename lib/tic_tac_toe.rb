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

  def won?
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

  def player2_won?
    any_column_won_2? || any_row_won_2? || any_diagonal_won_2?
  end

  def any_row_won_2?
    won = false
    3.times do |row|
      won = true if row_won_2?(row)
    end
    won
  end

  def row_won_2?(row)
    board[row][0] == 'o' and board[row][1] == 'o' and board[row][2] == 'o'
  end

  def any_column_won_2?
    won = false
    3.times do |column|
      won = true if column_won_2?(column)
    end
    won
  end

  def player1_won?
    any_column_won? || any_row_won? || any_diagonal_won?
  end

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

  def column_won?(column)
    board[0][column] == 'x' and board[1][column] == 'x' and board[2][column] == 'x'
  end

  def column_won_2?(column)
    board[0][column] == 'o' and board[1][column] == 'o' and board[2][column] == 'o'
  end

  def row_won?(row)
    board[row][0] == 'x' and board[row][1] == 'x' and board[row][2] == 'x'
  end

  def any_diagonal_won?
    (board[0][0] == 'x' and board[1][1] == 'x' and board[2][2]) == 'x' || (
      board[2][0] == 'x' and board[1][1] == 'x' and board[0][2] == 'x')
  end

  def any_diagonal_won_2?
    (board[0][0] == 'o' and board[1][1] == 'o' and board[2][2]) == 'o' || (
      board[2][0] == 'o' and board[1][1] == 'o' and board[0][2] == 'o')
  end
end
