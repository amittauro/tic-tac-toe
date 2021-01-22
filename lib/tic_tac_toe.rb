class TicTacToe

  def initialize(board = Board.new, players = Players.new)
    @board = board
    @players = players
  end

  def move_and_switch_players(input)
    @board.move(input, @players.current_player_marker)
    @players.reverse_players
  end

  def field_free?(input)
    @board.field_free?(input)
  end

  def game_over?
    @board.over?(@players.who_just_moved_marker)
  end
end
