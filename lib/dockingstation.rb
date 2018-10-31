class DockingStation
  attr_reader :bike
  def release_bike
    fail "No bikes available" unless @bike
    @bike
  end
  def dock(bike)
    fail "There's already a bike here" if @bike
    @bike = bike
  end
end

class Bike
  def working?
    true
  end
end
