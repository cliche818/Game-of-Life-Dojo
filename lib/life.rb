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

        display += space.to_s

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
    @board[x][y] = Cell.new(x, y)
  end

  def next_phase
    @old_board = @board.dup

    @board.each_with_index do |row, x|
      row.each_with_index do |space, y|
        if is_cell?(space) && space.neighbour_count(@board) < 2
          @board[x][y] = '.'
        end
      end
    end

  end

  def is_cell?(space)
    space.class == Cell
  end
end