require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @bike = bike
    true
  end
  def view_bikes
    @bike
  end
end
