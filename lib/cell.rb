class Cell
  attr_accessor :going_to_die, :alive, :going_to_live

  def initialize(x_coordinate, y_coordinate, alive=false)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @alive = alive
    reset_status
  end

  def reset_status
    @going_to_die = false
    @going_to_live = false
  end

  def to_s
    @alive ? '*' : '.'
  end

  def neighbour_count(board)
    count = 0

    max_row_number = @x_coordinate + 1
    min_row_number = @x_coordinate - 1
    max_column_number = @y_coordinate + 1
    min_column_number = @y_coordinate - 1

    (min_row_number..max_row_number).each do |x|
      (min_column_number..max_column_number).each do |y|

        if not_out_of_bounds?(board, x, y) && board[x][y].alive && not_same_coordinate(x, y) && is_neighbour?(x, y)
          count += 1
        end
      end
    end

    count
  end

  def is_neighbour?(x, y)
    (@x_coordinate == x && (@y_coordinate - y ).abs == 1 )||
      (@y_coordinate == y && (@x_coordinate - x ).abs == 1 ) ||
        ((@y_coordinate - y ).abs == 1 && (@x_coordinate - x ).abs == 1 )

  end

  def not_same_coordinate(x, y)
    !(x == @x_coordinate && y == @y_coordinate)
  end

  def not_out_of_bounds?(board, x, y)
    x < board.size && y < board[0].size && x >= 0 && y >= 0
  end

end