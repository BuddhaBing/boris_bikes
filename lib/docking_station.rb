require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @bikes << Bike.new
    @capacity = 20
  end

  def release_bike
    raise "no bikes available" if not @bikes
    bike = @bikes.pop
    @bikes = nil
    return bike
  end

  def dock_bike(bike)
    raise "docking station full" if !@bikes || @bikes.size == @capacity
    @bikes = bike
    true
  end

  def view_bikes
    @bike
  end
end
