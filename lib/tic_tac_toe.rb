class TicTacToe

  attr_reader :board, :moves, :player1, :player2, :player, :parser, :view

  def initialize(player1 = Player1.new, player2 = Player2.new, parser = Parser.new, view = View.new)
    @player1 = player1
    @player2 = player2
    @board = create_board
    @moves = 0
    @parser = parser
    @player = 1
    @view = view
  end

  def move(input)
    return 'invalid input or field taken try again' if !parser.valid?(input) || field_taken?(input)

    player_makes_move(input)
  end

  def game_over?
    player1.won?(board) || player2.won?(board) || all_fields_taken?
  end

  def show_board
    view.show(board)
  end

  private

  def player_makes_move(input)
    if player == 1
      player1move(row(input), column(input))
      @player = 2
    else
      player2move(row(input), column(input))
      @player = 1
    end
  end

  def player1move(row, column)
    @moves += 1
    board[row][column] = 'x'
    show_board
  end

  def player2move(row, column)
    @moves += 1
    board[row][column] = 'o'
    show_board
  end

  def all_fields_taken?
    moves == 9
  end

  def field_taken?(input)
    board[row(input)][column(input)] != nil
  end

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end

  def row(input)
    input[0].to_i
  end

  def column(input)
    input[2].to_i
  end
end
