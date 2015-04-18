class Graph
  require 'gruff'
  attr_accessor :gruff

  def initialize(title)
    @gruff = Gruff::Line.new(AppConfig::ImageSize)
    @gruff.title = title
    @gruff.font = Paths::Font
    @gruff.__send__(AppConfig::DefaultTheme)

    @length = 0
  end

  def append(category, points)
    @gruff.data(category, points)
  end

  def theme=(theme)
    right_theme? ? @gruff.__send__(theme) : false
  end

  def labels=(labels)
    @gruff.labels = labels
  end

  def plot!
    @gruff.to_blob
  end

  private

  def right_theme?(theme)
    AppConfig::Themes.include?(theme)
  end
end
