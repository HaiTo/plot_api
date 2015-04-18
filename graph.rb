class Graph
  require 'gruff'
  attr_accessor :gruff

  def initialize(title)
    @gruff = Gruff::Line.new(AppConfig::ImageSize)
    @gruff.title = title
    @gruff.font = Paths::Font
    @gruff.__send__(AppConfig::Theme)

    @length = 0
  end

  def append(category, points)
    @gruff.data(category, points)
  end

  def labels=(labels)
    @gruff.labels = labels
  end

  def plot!
    [200, {'Content-Type' => 'image/png'}, @gruff.to_blob]
  end
end
