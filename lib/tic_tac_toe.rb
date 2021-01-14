class TicTacToe

  attr_reader :board, :moves, :player1, :player2, :player, :parser

  def initialize(player1 = Player1.new, player2 = Player2.new, parser = Parser.new)
    @player1 = player1
    @player2 = player2
    @board = create_board
    @moves = 0
    @parser = parser
    @player = 1
  end

  def move(input)
    return true unless parser.valid?(input)

    return true if field_taken?(input)

    if player == 1
      player1move(row(input), column(input))
      @player = 2
    else
      player2move(row(input), column(input))
      @player = 1
    end
    true
  end

  def player1move(row, column)
    @moves += 1
    board[row][column] = 'x'
    board
  end

  def player2move(row, column)
    @moves += 1
    board[row][column] = 'o'
    board
  end

  def won
    if player1.won?(board)
      result = 'Player1 has won the game'
    elsif player2.won?(board)
      result = 'Player2 has won the game'
    end
    result
  end

  def over
    return 'the game is over' if moves == 9
  end

  private

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
