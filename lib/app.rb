class App

  attr_reader :tic_tac_toe

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
      when 'show board'
        tic_tac_toe.show_board
      when 'quit'
        puts "you quit the game\n"
        break
      end
      tic_tac_toe.move(input)
      break if tic_tac_toe.game_over?
    end
    puts 'game over'
  end

  private

  def get_help
    help = ['This is a game of tic-tac-toe',
    'The first row is row 0 and the first column is column 0',
    'To input into the top left field, type: 0 0',
    'To input into the bottom right field, type: 2 2',
    'Type quit to exit the game',
    'Type show board to see the board at any point'
    ].join("\n")
    puts help
  end
end
