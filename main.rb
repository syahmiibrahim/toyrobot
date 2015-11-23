require_relative 'simulation_robot'

class Main
  
  def start
    @simulation = RobotSimulation.new

    run = true
    while run
      system "clear"
      menu
      input = gets.chomp
      case input
        when "1"
          position_option
        when "2"
          left_option
        when "3"
          right_option
        when "4"
          move_option
        when "5" 
          report_option
        when "E", "e"
          run = false
          puts "Exiting.. Thank You"
        else
          puts "Invalid input. Press enter any option above:"
          gets.chomp
      end
    end
  end

  def menu
    puts "|=====================|"
    puts "| Toy Robot Simulator |"
    puts "|=====================|"
    puts "Welcome to toy robot simulator. Please choose an option below:"
    puts "1. PLACE (X,Y,F) COORDINATE"
    puts "2. ROTATE LEFT"
    puts "3. ROTATE RIGHT"
    puts "4. MOVE"
    puts "5. REPORT"
    puts "e. EXIT SIMULATION"
    print "Input: "
  end

  def position_option
    print "Enter X co-ordinate: "
    x = gets.chomp
    print "Enter Y co-ordinate: "
    y = gets.chomp
    print "Enter Direction (N - North, E - East, S - South, W - West): "
    direction = gets.chomp.upcase
    
    if @simulation.place(x.to_i, y.to_i, direction) == false
      puts"Invalid input. Please try again."
      sleep 2
    else
      print "The robot is placed at the following location:" + 
            " (X,Y,F) (#{x},#{y},#{direction})"
      sleep 2
    end
  end

  def left_option
    if @simulation.left == false
      print "Can't rotate the robot. Is the robot placed accordingly?"
    else
      print "Rotating robot to the left."
    end
    sleep 2
  end

  def right_option
    if @simulation.right == false
      print "Can't rotate the robot. Is the robot placed accordingly?"
    else
      print "Rotating robot to the right."
    end
    sleep 2
  end
  
  def move_option
    if @simulation.move != false
      print "Move the robot to the direction requested." 
    else
      print "Unable to move robot. Is the robot placed accordingly?"
    end
    sleep 2
  end

  def report_option
    report = @simulation.report
    if report != nil
      puts "X: #{report['x']}"  
      puts "Y: #{report['y']}"
      puts "Direction: #{report['direction']}"
    else
      print "Unable to report. Is the robot placed accordingly?"
    end
    sleep 2
  end
end

toyRobot = Main.new
toyRobot.start
