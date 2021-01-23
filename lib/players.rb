class Players

  def initialize(player = Player)
    @players = [player.new('x'), player.new('o')]
  end

  def reverse_players
    @players.reverse!
  end

  def get_marker(player)
    @players[player].marker
  end
end
