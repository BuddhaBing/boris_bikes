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
    raise "all bikes are broken" if @bikes.all? {|bike| !bike.working?}
    @bikes.pop
  end

  def dock_bike(bike, working=true)
    raise "bike station full" if full?
    bike.working_status = working
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
