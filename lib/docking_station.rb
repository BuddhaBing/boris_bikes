require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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

  private
  def full?
    @bikes.size >= @capacity
  end
end
