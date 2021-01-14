class App

  attr_reader :tic_tac_toe

  def initialize(tic_tac_toe = TicTacToe.new)
    @tic_tac_toe = tic_tac_toe
  end

  def run
  end

end
