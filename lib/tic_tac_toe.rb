class TicTacToe

  attr_reader :players, :board

  def initialize(players, board)
    @players = players
    @board = board
  end

  def run
    puts 'type ? for help'
    while true
      input = gets.chomp
      case input
      when '?'
        get_help
      when 'quit'
        puts "you quit the game\n"
        break
      when /[0-2] [0-2]/
        select_player(input)
      end
      break if over?
    end
    puts 'game over'
  end

  private

  def select_player(input)
    if field_free?(input)
      players[0].move(input)
      players.reverse!
    end
  end

  def over?
    players[0].won? || players[1].won? || all_fields_taken?
  end

  def all_fields_taken?
    board.flatten.all? { |field| field != nil }
  end

  def field_free?(input)
    row = input[0].to_i
    column = input[2].to_i
    board[row][column] == nil
  end

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
