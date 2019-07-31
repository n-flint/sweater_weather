class BackgroundSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :image, :link
end