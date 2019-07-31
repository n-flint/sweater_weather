class RoadtripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :travel_time
end