class App

  attr_reader :tic_tac_toe, :display, :players

  def initialize(setup = Setup.new, tic_tac_toe = TicTacToe, display = Display.new)
    @players = setup.players
    @tic_tac_toe = tic_tac_toe.new(setup.board)
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
      end
      break if tic_tac_toe.over?(current_player.marker)
    end
    display.over
  end

  private

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end

  def select_player(input)
    if players[0].can_move?(input)
      players[0].move(input)
      players.reverse!
    end
  end

  def current_player
    players[1]
  end
end
