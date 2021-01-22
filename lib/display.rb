class Display

  def print(board)
    print_rows(board)
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

  def quit
    puts "you quit the game"
  end

  def over
    puts "game over"
  end

  def ask_for_help
    puts "type ? for help"
  end

  private

  def print_rows(board)
    board.flatten.each_slice(3) do |row|
      puts convert_empty_fields_to_strings(row).join("|")
    end
  end

  def convert_empty_fields_to_strings(row)
    row.map do |field|
      field = " " if !field
      field
    end
  end
end
