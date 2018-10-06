class Plane
  attr_reader :location

  def initialize
    @location = "sky"
  end

  def land(airport)
    raise "Airport is full!" if airport.landed_planes.count >= airport.capacity
    raise "Plane already in the airport." if airport.landed_planes.include? self
    raise "Stormy weather, cannot land." if airport.weather == "stormy"
    airport.landed_planes << self
    @location = "airport"
  end

  def take_off(airport)
    raise "Plane not in the airport." unless airport.landed_planes.include? self
    raise "Stormy weather, cannot take off." if airport.weather == "stormy"
    airport.landed_planes.delete(self)
    @location = "sky"
  end
end
