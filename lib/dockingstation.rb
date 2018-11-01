class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bikes available" if (@bikes.empty?)
    @bikes.first
  end

  def dock(bike)
    fail "There's already 20 bikes here" if (@bikes.count == 20)
    @bikes << bike
  end
end

class Bike
  def working?
    true
  end
end
