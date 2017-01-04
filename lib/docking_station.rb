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
    @bikes.each_with_index do |bike,index|
      if bike.working?
        @bikes.delete_at(index)
        return bike
      end
    end
    raise "no good bikes available"
  end

  def dock_bike(bike, working=true)
    raise "docking station full" if full?
    bike.working_status = false if !working
    @bikes << bike
    true
  end

  private
  def full?
    @bikes.size >= @capacity
  end
end
