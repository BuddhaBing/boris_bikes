require_relative 'bike'

class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
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
    @bikes.size >= DEFAULT_CAPACITY
  end
end
