class Life

  def initialize(number_of_rows, number_of_columns)
    @board = Array.new(number_of_rows) { Array.new(number_of_columns) }
    @number_of_columns = number_of_columns
  end

  def display
    display = ""

    @board.each do  |row|
      row.each_with_index do |space, index|
        display += '.'

        if @number_of_columns > index + 1
          display += ' '
        else
          display += "\n"
        end
      end
    end

    display
  end
end