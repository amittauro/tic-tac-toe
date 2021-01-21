class Player

  attr_reader :marker, :board
  def initialize(marker, board)
    @marker = marker
    @board = board
  end

  def move(input)
    row = input[0].to_i
    column = input[2].to_i
    board[row][column] = marker
    board
  end

  def can_move?(input)
    row = input[0].to_i
    column = input[2].to_i
    board[row][column] == nil
  end
end
