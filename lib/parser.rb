class Parser

  attr_reader :read_row, :read_column
  def valid?(input)
    /[0-2] [0-2]/ === input
  end

  def read(input)
    if valid?(input)
      @read_row = input[0].to_i
      @read_column = input[0].to_i
    else
      puts 'Invalid input please try again or type help for info'
    end
  end
end
