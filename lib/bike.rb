class Bike

  attr_accessor :working_status

  def initialize
    @working_status = true
  end

  def working?
    @working_status
  end

end
