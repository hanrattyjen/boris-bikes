require './lib/docking_station'
#require 'docking_station'

puts "Docking and releasing bike:"
puts station = DockingStation.new
puts bike = Bike.new
station.dock(bike)
puts station.release_bike