require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bike = Bike.new
  end

  def release_bike
    #return Bike.new
    if @bike
      bike = @bike
      @bike = nil
      return bike
    else
      raise "no bikes available"
    end
  end

  def dock_bike(bike)
    raise "bike station full" if @bike
    @bike = bike
    true
  end

end
