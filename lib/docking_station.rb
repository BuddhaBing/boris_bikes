require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    raise "no bikes available" if @bikes.size == 0
    @bikes.pop
  end

  def dock_bike(bike)
    raise "docking station full" if full?
    @bikes << bike
    true
  end

  def view_bikes
    @bikes
  end
  private
  def full?
    @bikes.size >= @capacity
  end
end
