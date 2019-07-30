class Giphy
  attr_reader :time, :summary, :url

  def initialize(day, url)
    @time = day.time
    @summary = day.summary
    @url = url
  end
end