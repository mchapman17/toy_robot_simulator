class Position

  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def coordinates
    [x, y]
  end

end