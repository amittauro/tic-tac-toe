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

  def can_move?(input)
    row = input[0].to_i
    column = input[2].to_i
    board[row][column] == nil
  end
end
