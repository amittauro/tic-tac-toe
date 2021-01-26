class App

  attr_reader :display
  def initialize(tic_tac_toe = TicTacToe.new, display = Display.new)
    @tic_tac_toe = tic_tac_toe
    @display = display
  end

  def run
    display.ask_for_help
    while true
      input = gets.chomp
      case input
      when '?'
        display.get_help
      when 'quit'
        break
      when /[0-2] [0-2]/
        @tic_tac_toe.play(input)
      end
      break if @tic_tac_toe.over?
    end
    display.over
  end
end

#discuss tic tac toe class acting as interface. imterface segregaryon - too mnay piblic methods??
