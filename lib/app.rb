class App

  attr_reader :tic_tac_toe

  def initialize(tic_tac_toe = TicTacToe.new)
    @tic_tac_toe = tic_tac_toe
  end

  def run
    while true
      input = gets.chomp
      case input
      when 'quit'
        puts "you quit the game\n"
        break
      end
      tic_tac_toe.move(input)
    end
  end
end
