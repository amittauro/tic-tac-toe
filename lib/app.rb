class App

  def initialize(tic_tac_toe = TicTacToe.new)
    @tic_tac_toe = tic_tac_toe
  end

  def run
    puts "type ? for help"
    while true
      input = gets.chomp
      case input
      when '?'
        get_help
      when 'quit'
        break
      when /[0-2] [0-2]/
        @tic_tac_toe.play(input)
      end
      break if @tic_tac_toe.over?
    end
    puts "game over"
  end

  private

  def get_help
    help = ['This is a game of tic-tac-toe',
    'The first row is row 0 and the first column is column 0',
    'To input into the top left field, type: 0 0',
    'To input into the bottom right field, type: 2 2',
    'Type quit to exit the game',
    ].join("\n")
    puts help
  end
end
