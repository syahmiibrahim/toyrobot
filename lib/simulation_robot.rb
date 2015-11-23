require_relative 'board'
require_relative 'robot'

class RobotSimulation

  def initialize
    @board = Board.new
    @robot = Robot.new
    @placed = false
  end

  def board
    @board
  end

  def robot
    @robot
  end
  
  def is_placed
    @placed
  end

  def place(x = 5, y = 5, direction = 'N')
    board.valid_x(x) && board.valid_y(y) && robot.valid_direction(direction) ? 
        valid_x_and_y_values(x, y, direction) : @placed = false
  end

  def left
    is_placed ? @robot.rotate_left : false 
  end

  def right
    is_placed ? @robot.rotate_right : false 
  end

  def move
    if is_placed == true
      move_result = calculate_movement
      in_border(move_result) ? update_robot_coordinates(move_result) : false
    else
      return false
    end
  end

  def report
    is_placed ? generate_report : nil
  end

  def generate_report
    report_hash = { 'x' => robot.x_location,
                    'y' => robot.y_location,
                    'direction' => robot.direction }
  end
  
  def update_robot_coordinates(move_result)
    robot.x_location = move_result['x']
    robot.y_location = move_result['y']
  end

  def calculate_movement
    x_move_calc = { 'W' => -1, 'E' => 1 }
    y_move_calc = { 'N' => 1, 'S' => -1 }
    x_move_calc[robot.direction] != nil ? x = robot.x_location + x_move_calc[robot.direction] : x = robot.x_location
    y_move_calc[robot.direction] != nil ? y = robot.y_location + y_move_calc[robot.direction] : y = robot.y_location
    return { 'x' => x, 'y' => y } 
  end

  def in_border( values = {'x' => nil, 'y' => nil} )
    board.valid_x(values['x']) && board.valid_y(values['y']) ? true : false
  end

  def valid_x_and_y_values(x, y, direction)
    @robot.x_location = x
    @robot.y_location = y
    @robot.direction = direction
    @placed = true
  end

  private :valid_x_and_y_values, :calculate_movement, :update_robot_coordinates, :in_border
end
