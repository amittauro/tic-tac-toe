def array_column_win(column, player)
  array = Array.new(3, nil).map{ |row| Array.new(3, nil) }
  3.times do |row|
    array[row][column] = player
  end
  array
end

def array_row_win(row, player)
  array = Array.new(3, nil).map{ |row| Array.new(3, nil) }
  3.times do |column|
    array[row][column] = player
  end
  array
end
