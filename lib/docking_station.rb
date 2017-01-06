require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @bikes << Bike.new
  end

  def release_bike
    raise "no bikes available" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "bike station full" if full?
    @bikes << bike
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.size >= DEFAULT_CAPACITY
  end

end
