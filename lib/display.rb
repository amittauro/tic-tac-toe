# frozen_string_literal: true

# Class for outputting to terminal
class Display
  def print(board)
    print_rows(board)
  end

  private

  def print_rows(board)
    board.flatten.each_slice(3) do |row|
      puts convert_empty_fields_to_strings(row).join('|')
    end
  end

  def convert_empty_fields_to_strings(row)
    row.map do |field|
      field ||= ' '
      field
    end
  end
end
