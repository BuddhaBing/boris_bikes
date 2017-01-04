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
    @bike = bike
    true
  end
  def view_bikes
    @bike
  end
end
