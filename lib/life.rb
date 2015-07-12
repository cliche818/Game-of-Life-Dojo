class Life

  def initialize(number_of_rows, number_of_columns)
    @board = Array.new(number_of_rows) { Array.new(number_of_columns) { '.' } }
    @number_of_columns = number_of_columns
    @number_of_rows = number_of_rows
  end

  def display
    display = ''

    @board.each do  |row|
      row.each_with_index do |space, index|
        display += space

        if @number_of_columns > index + 1
          display += ' '
        else
          display += "\n"
        end
      end
    end

    display
  end

  def add_cell(x, y)
    @board[x][y] = '*'
  end

  def next_phase
    @old_board = @board.dup


    @board.each_with_index do |row, x|
      row.each_with_index do |space, y|
        if is_cell?(space) && neighbour_count(x, y) < 2
          @board[x][y] = '.'
        end
      end
    end

  end

  #def neighbour_count(x, y)
  #  count = 0
  #
  #  max_row_number = x + 1
  #  max_column_number = y + 1
  #
  #  max_row_number.times do |x|
  #    max_column_number.times do |y|
  #
  #      if not_out_of_bounds?(x, y) && is_cell?(@board[x][y])
  #        count += 1
  #      end
  #    end
  #  end
  #
  #  count
  #end

  #def not_out_of_bounds?(x, y)
  #  x < @number_of_rows || y < @number_of_columns
  #end
end