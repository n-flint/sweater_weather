class RoadtripFacade
  attr_reader :id

  def initialize(roadtrip_data)
    @id = 1
    @origin = roadtrip_data['origin']
    @destination = roadtrip_data['destination']
  end

  def travel_time
    service.duration['text']
  end

  def destination_coords
    service.destination_coords
  end

  private

  def service
    @roadtrip_service = RoadtripService.new(@origin, @destination)
  end
end