class App

  attr_reader :tic_tac_toe, :display

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
        display.quit
        break
      when /[0-2] [0-2]/
        select_player(input)
        display.print(tic_tac_toe.board)
      end
      break if tic_tac_toe.over?(current_player)
    end
    display.over
  end

  private

  def select_player(input)
    if tic_tac_toe.players[0].can_move?(input)
      tic_tac_toe.players[0].move(input)
      tic_tac_toe.reverse_players
    end
  end

  def current_player
    tic_tac_toe.players[1]
  end
end
