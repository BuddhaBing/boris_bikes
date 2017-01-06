require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  def initialize
    @capacity = 20
    @bikes = []
    @bikes << Bike.new
  end

  def release_bike
    if !@bikes.empty?
      @bikes.pop
    else
      raise "no bikes available"
    end
  end

  def dock_bike(bike)
    raise "bike station full" if @bikes.size >= @capacity
    @bikes << bike
    true
  end

end
