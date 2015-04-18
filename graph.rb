class Graph
  require 'gruff'
  attr_accessor :gruff

  def initialize(title)
    @gruff = Gruff::Line.new
    @gruff.title = title
    @gruff.font = Paths::Font

    @length = 0
  end

  def set(category, points)
    @gruff.data(category, points)

    # NOTE グラフ横サイズを拡張する
    @length = (points.size > @length ? points.size : @length)
  end

  def plot!
    @gruff.labels = @length.times.inject({}) {|hs, index|
        hs[index] = "#{index}"
        hs
      }
    @gruff.to_blob
  end
end
