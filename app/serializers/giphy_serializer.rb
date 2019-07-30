class GiphySerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :images
end