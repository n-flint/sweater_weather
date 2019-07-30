class FlickrImage
  attr_reader :id, :image_data

  def initialize(image_data)
    @id = image_data['id']
    @image_data = image_data
  end

end