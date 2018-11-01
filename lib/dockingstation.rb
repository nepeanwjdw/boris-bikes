class DockingStation
  attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.first
  end

  def dock(bike)
    fail "There's already 20 bikes here" if full?
    @bikes << bike
  end

  private
  def full?
    @bikes.count == @capacity
  end

  def empty?
   @bikes.empty?
  end
end

class Bike
  def working?
    true
  end
end
