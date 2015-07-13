class Life

  def initialize(number_of_rows, number_of_columns)
    @board = Array.new(number_of_rows) { Array.new(number_of_columns) { '.' } }
    @number_of_columns = number_of_columns
    @number_of_rows = number_of_rows

    @board.each_with_index do |row, x|
      row.each_with_index do |space, y|
        @board[x][y] = Cell.new(x,y)
      end
    end
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

  def set_initial_living_cell(x, y)
    @board[x][y].alive = true
  end

  def next_phase
    @board.each_with_index do |row, x|
      row.each_with_index do |space, y|
        neighbour_count = space.neighbour_count(@board)

        if neighbour_count < 2
          p "DIE!! x: #{x} y: #{y}"
          @board[x][y].going_to_die = true
        elsif neighbour_count > 3
          p "DIE!!! x: #{x} y: #{y}"
          @board[x][y].going_to_die = true
        elsif neighbour_count == 3
          p "LIVE!!! x: #{x} y: #{y}"
          @board[x][y].going_to_live = true
        end
      end
    end

    change_for_next_phase
  end

  private

  def change_for_next_phase
    @board.each_with_index do |row, x|
      row.each_with_index do |space, y|
        if space.going_to_die
          @board[x][y].alive = false
          @board[x][y].reset_status
        elsif space.going_to_live
          @board[x][y].alive = true
          @board[x][y].reset_status
        end
      end
    end
  end

end