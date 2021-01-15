class Player

  attr_reader :marker, :board, :display
  def initialize(marker, board, display = Display.new)
    @marker = marker
    @board = board
    @display = display
  end

  def move(input)
    row = input[0].to_i
    column = input[2].to_i
    board[row][column] = marker
    display.print(board)
    board
  end

  def won?
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
    (board[0][0] == marker and board[1][1] == marker and board[2][2]) == marker || (
      board[2][0] == marker and board[1][1] == marker and board[0][2] == marker)
  end

  def column_won?(column)
    board[0][column] == marker and board[1][column] == marker and board[2][column] == marker
  end

  def row_won?(row)
    board[row][0] == marker and board[row][1] == marker and board[row][2] == marker
  end
end
