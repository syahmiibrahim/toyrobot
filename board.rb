class Board
  DEFAULT_DIMENSION=4
  
  def initialize (x = DEFAULT_DIMENSION, y = DEFAULT_DIMENSION)
    x < 0 ? @x_border = DEFAULT_DIMENSION : @x_border = x
    y < 0 ? @y_border = DEFAULT_DIMENSION : @y_border = y
  end

  def x_border
    @x_border
  end

  def x_border=(new_x_border)
    @x_border = new_x_border
  end

  def y_border
    @y_border
  end

  def y_border=(new_y_border)
    @y_border = new_y_border
  end

  def size
    (@x_border + 1) * (@y_border + 1)
  end

  def valid_x(value)
    return value >= 0 && value <= @x_border ? true : false
  end

  def valid_y(value)
    return value >= 0 && value <= @y_border ? true : false
  end
end
