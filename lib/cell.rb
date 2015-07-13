class Cell
  attr_accessor :going_to_die

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @going_to_die = false
  end

  def to_s
    '*'
  end

  def neighbour_count(board)
    count = 0

    max_row_number = @x_coordinate + 1
    max_column_number = @y_coordinate + 1

    (max_row_number + 1).times do |x|
      (max_column_number + 1).times do |y|

        if not_out_of_bounds?(board, x, y) && has_cell?(board, x, y) && not_same_coordinate(x, y) && is_neighbour?(x, y)
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


  def has_cell?(board, x, y)
    board[x][y].class == Cell
  end

  def not_out_of_bounds?(board, x, y)
    x < board.size && y < board[0].size
  end

end