class Robot
  DEFAULT_LOCATION = 0
  DEFAULT_DIRECTION = 'N' #NORTH

  def initialize(x = DEFAULT_LOCATION, y = DEFAULT_LOCATION, direction = DEFAULT_DIRECTION)
    @orientation = ['N', 'E', 'S', 'W' ]
    x < 0 ? @x_location = DEFAULT_LOCATION : @x_location = x
    y < 0 ? @y_location = DEFAULT_LOCATION : @y_location = y
    valid_direction(direction) ? @direction = direction : @direction = DEFAULT_DIRECTION
  end

  def x_location
    @x_location
  end

  def x_location=(new_x_location)
    @x_location = new_x_location
  end

  def y_location
    @y_location
  end

  def y_location=(new_y_location)
    @y_location = new_y_location
  end

  def direction
    @direction
  end

  def direction=(new_direction)
    @direction = new_direction
  end


  def valid_direction(direction)
    orientation_index(direction) != nil ? true : false
  end 
  
  def rotate_left
    index = orientation_index(direction) 
    index == 0 ? index = @orientation.length - 1 : index -= 1
    @direction = @orientation[index]
  end

  def rotate_right
    index = orientation_index(direction)
    index == @orientation.length - 1 ? index = 0 : index += 1
    @direction = @orientation[index]
  end
  
  def orientation_index(direction)
    @orientation.find_index(direction.upcase)
  end

  private :orientation_index
end
