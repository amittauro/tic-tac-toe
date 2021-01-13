class App

  attr_reader :player1, :player2, :tic_tac_toe

  def initialize(player1 = Player1.new, player2 = Player2.new, tic_tac_toe = TicTacToe.new)
    @player1 = player1
    @player2 = player2
    @tic_tac_toe = tic_tac_toe
  end

  def run
    input = nil
    while input != 'quit'
      input = gets.chomp
      if input == 'quit'
        break
      end
      tic_tac_toe.player1move(row(input), column(input))
    end
  end

  private

  def row(input)
    input[0].to_i
  end

  def column(input)
    input[2].to_i
  end

end
