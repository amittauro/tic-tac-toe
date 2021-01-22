class Players

  def initialize(player = Player)
    @players = [player.new('x'), player.new('o')]
  end

  def reverse_players
    @players.reverse!
  end

  def current_player_marker
    @players[0].marker
  end

  def who_just_moved_marker
    @players[1].marker
  end
end
