require_relative 'engine'
require_relative 'gyroscope'
require_relative 'orientation_sensor'

class Drone
  attr :engines, :gyroscope, :orientation_sensor, :status
  
  OFF = 0
  HOVERING = 1
  MOVING = 2
  
  def initialize
    @engines = []

    4.times do 
      @engines << Engine.new
    end
    
    @gyroscope = Gyroscope.new
    @orientation_sensor = OrientationSensor.new
    
    @status = OFF
  end
  
  def take_off(power)
    if power==0
      puts "FAILED TO TAKE OFF"
    end
    
    @engines.each do |e| 
      e.status_on
      e.power = power
    end
    
    @status = MOVING
  end
  
  def move_forward(velocity)
    @status = MOVING
    @gyroscope.x_vector = velocity
  end
  
  def move_back(velocity)
    @status = MOVING
    @gyroscope.x_vector = velocity
  end
  
  def move_up(velocity)
    @status = MOVING
    @gyroscope.y_vector = velocity
  end
  
  def move_down(velocity)
    @status = MOVING
    @gyroscope.y_vector = velocity
  end
  
  def move_left
    @status = MOVING
    @gyroscope.z_vector = velocity
  end
  
  def move_right
    @status = MOVING
    @gyroscope.z_vector = velocity
  end
  
  def stabilize
    @status = HOVERING
  end
  
  def land
    @status = MOVING 
  end
  
  def engine_broken
    @engines.each_with_index {|e, i|
       puts "ENGINE NUMBER #{i} has broken, starting to land" if e.status_off && status.include?(HOVERING, MOVING)
    }
    
    land
  end
  
end