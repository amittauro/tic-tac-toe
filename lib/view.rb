class View

  def show(board)
    table = board.map do |row|
      row.map do |field|
        if field == nil
          field = " "
        else
          field = field
        end
      end
    end
    display = [
      "#{table[0][0]}|#{table[0][1]}|#{table[0][2]}",
      "#{table[1][0]}|#{table[1][1]}|#{table[1][2]}",
      "#{table[2][0]}|#{table[2][1]}|#{table[2][2]}"
    ].join("\n")
    puts display
  end
end
