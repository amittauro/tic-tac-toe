class TicTacToe

  def initialize(board = Board.new)
    @board = board
    @markers = ['x', 'o']
  end

  def play(input)
    move_and_switch_players(input) if field_free?(input)
  end

  def over?
    @board.over?(player_who_just_moved)
  end

  private

  attr_reader :board, :markers

  def move_and_switch_players(input)
    board.move(input, current_player)
    markers.reverse!
  end

  def field_free?(input)
    board.field_free?(input)
  end

  def current_player
    markers[0]
  end

  def player_who_just_moved
    markers[1]
  end
end
