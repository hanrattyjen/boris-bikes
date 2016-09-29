require './lib/docking_station'
#require 'docking_station'

puts "Docking and releasing bike:"
puts station = DockingStation.new
puts bike = Bike.new
station.dock(bike)
puts station.release_bike

puts
puts "Testing Full capacity using constant"
20.times {station.dock(Bike.new)}
puts station.dock(Bike.new)

