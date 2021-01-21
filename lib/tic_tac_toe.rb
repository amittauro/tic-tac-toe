class TicTacToe

  attr_reader :board, :marker, :players

  def initialize(player = Player)
    @board = create_board
    @players = [player.new('x', @board), player.new('o', @board)]
  end

  def over?(current_player)
    @marker = current_player.marker
    rows_or_columns? || diagonals? || all_fields_taken?
  end

  def reverse_players
    @players.reverse!
  end

  private

  def rows_or_columns?
    won = false
    3.times do |i|
      won = true if row_won?(i) || column_won?(i)
    end
    won
  end

  def diagonals?
    (board[0][0] == marker and board[1][1] == marker and board[2][2]) == marker || (
      board[2][0] == marker and board[1][1] == marker and board[0][2] == marker)
  end

  def column_won?(column)
    board[0][column] == marker and board[1][column] == marker and board[2][column] == marker
  end

  def row_won?(row)
    board[row][0] == marker and board[row][1] == marker and board[row][2] == marker
  end

  def all_fields_taken?
    board.flatten.all? { |field| field != nil }
  end

  def create_board
    Array.new(3, nil).map{ |row| Array.new(3, nil) }
  end
end
