require_relative 'bike'

class DockingStation
  attr_reader :bike, :capacity

  def initialize
    @bike = Bike.new
    @capacity = 1
  end

  def release_bike
    raise "no bikes available" if not @bike
    bike = @bike
    @bike = nil
    return bike
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
