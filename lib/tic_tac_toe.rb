class TicTacToe

  def initialize(board = Board.new, players = Players.new)
    @board = board
    @players = players
  end

  def play(input)
    move_and_switch_players(input) if field_free?(input)
  end

  def game_over?
    @board.over?(@players.get_marker(1))
  end

  private

  attr_reader :board, :players

  def move_and_switch_players(input)
    board.move(input, players.get_marker(0))
    players.reverse_players
  end

  def field_free?(input)
    board.field_free?(input)
  end
end
