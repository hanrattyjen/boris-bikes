require_relative 'bike'

class Van

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @broken_bikes = []
    @capacity = capacity
  end

  def load(broken_bikes)
    fail "Van capacity has been reached" if @broken_bikes.count >= DEFAULT_CAPACITY
    @broken_bikes << broken_bikes
  end

  def unload
    @broken_bikes.clear
  end

end
