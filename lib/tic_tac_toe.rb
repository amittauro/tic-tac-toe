class TicTacToe

  def initialize(board = Board.new, markers = Markers.new)
    @board = board
    @markers = markers
  end

  def play(input)
    move_and_switch_players(input) if field_free?(input)
  end

  def over?
    @board.over?(@markers.who_just_moved)
  end

  private

  attr_reader :board, :markers

  def move_and_switch_players(input)
    board.move(input, markers.current_marker)
    markers.reverse
  end

  def field_free?(input)
    board.field_free?(input)
  end
end
