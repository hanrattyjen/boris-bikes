require_relative 'bike'

class DockingStation
	attr_reader :bike

	def release_bike
		fail 'No bikes available' unless @bike
		@bike
	end

	def dock(bike)
		fail 'Docking station full' if @bike
		# use an instance variable to store the bike in the 'state' of this instance
		@bike = bike
	end
end
