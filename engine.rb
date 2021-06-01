class Engine
  attr :power, :status
  
  OFF = false
  ON = true
  
  def initialize
    @status = OFF
  end
  
  def power=(value)
    if value < 0 || value > 100
      puts "Value must be between 0 and 100."
    else
      @power = value
    end
  end
  
  def status_on
    @status = ON
  end
  
  def status_off
    @status = OFF
  end
    
end