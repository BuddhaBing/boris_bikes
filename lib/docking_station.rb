require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    if @bike
      Bike.new
    end
  end

  def dock_bike(bike)
    @bike = bike
    true
  end
  def view_bikes
    @bike
  end
end
