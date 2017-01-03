require_relative 'bike'

class DockingStation

  attr_accessor :bike

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

end
