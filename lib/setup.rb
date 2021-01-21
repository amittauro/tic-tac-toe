class Setup

  attr_reader :player, :players, :board
  def initialize(player = Player)
    @player = player
    @board = create_board
    @players = create_players
  end

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end

  def create_players
    player1 = player.new('x', board)
    player2 = player.new('o', board)
    [player1, player2]
  end
end
