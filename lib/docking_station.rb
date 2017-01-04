require_relative 'bike'

class DockingStation
  attr_reader :bike, :capacity

  def initialize
    @bike = Bike.new
    @capacity = 1
  end

  def release_bike
    if @bike
      bike = @bike
      @bike = nil
      return bike
    else
      raise "no bikes available"
    end
  end

  def dock_bike(bike)
    raise "docking station full" if @bike
    @bike = bike
    true
  end

  def view_bikes
    @bike
  end
end
