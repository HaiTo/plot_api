class Graph
  def initialize(title, size)
    @gruff = Gruff::Bezier.new(size.nil? ? AppConfig::ImageSize : size)
    @gruff.title = title
    @gruff.font = Paths::Font
    @gruff.__send__(AppConfig::DefaultTheme)

    @length = 0
  end

  def append(category, points)
    @gruff.data(category, points)
  end

  def labels=(labels)
    @gruff.labels = labels
  end

  def plot!
    @gruff.to_blob
  end
end
