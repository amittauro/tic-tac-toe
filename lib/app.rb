class App

  attr_reader :display
  def initialize(tic_tac_toe = TicTacToe.new, display = Display.new, players = Players.new)
    @tic_tac_toe = tic_tac_toe
    @display = display
    @players = players
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
        next unless field_free?(input)
        move_and_switch_players(input)
      end
      break if game_over?
    end
    display.over
  end

  private

  attr_reader :players, :tic_tac_toe

  def move_and_switch_players(input)
    tic_tac_toe.move(input, players.current_player_marker)
    players.reverse_players
  end

  def field_free?(input)
    tic_tac_toe.field_free?(input)
  end

  def game_over?
    tic_tac_toe.over?(players.who_just_moved_marker)
  end
end
