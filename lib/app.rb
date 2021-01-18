class App

  attr_reader :player, :tic_tac_toe

  def initialize(player = Player, tic_tac_toe = TicTacToe)
    @player = player
    @tic_tac_toe = tic_tac_toe
  end

  def run
    board = create_board
    player1 = player.new('x', board)
    player2 = player.new('o', board)
    tic_tac_toe.new([player1, player2], board).run
  end

  private

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end
end
