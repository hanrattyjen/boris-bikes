require_relative 'bike'

class DockingStation

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Dock is full" if full?
    @bikes << bike
  end
  
  private
  def full?
    @bikes.count >= 20
  end
  
  def empty?
    @bikes.empty?
  end

end

#station = DockingStation.new
#bike = Bike.new
#station.dock(bike)
#station.dock(bike)
#station.release_bike
