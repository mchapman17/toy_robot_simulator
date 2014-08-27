class Hole

  attr_reader :origin, :width, :height

  def initialize(origin:, width:, height:)
    @origin = origin
    @width = width
    @height = height
  end

end