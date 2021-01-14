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
    return true if !parser.valid?(input)

    return true if field_taken?(input)

    if player == 1
      player1move(row(input), column(input))
      @player = 2
      show_board
    else
      player2move(row(input), column(input))
      @player = 1
      show_board
    end

    return false if game_over?
    true
  end

  def show_board
    view.show(board)
  end

  private

  def player1move(row, column)
    @moves += 1
    board[row][column] = 'x'
  end

  def player2move(row, column)
    @moves += 1
    board[row][column] = 'o'
  end

  def all_fields_taken?
    if moves == 9
      puts 'all fields taken'
      return true
    end
  end

  def game_over?
    player1.won?(board) || player2.won?(board) || all_fields_taken?
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
