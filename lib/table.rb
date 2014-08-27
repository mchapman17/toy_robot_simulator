class Table

  def initialize(width: 4, height: 4)
    @origin = Position.new(x: 0, y: 0)
    @width = width
    @height = height
  end

  def positions_valid?(x, y)
    position_x_valid?(x) && position_y_valid?(y)
  end


  private

    attr_reader :origin, :width, :height

    def position_x_valid?(x)
      x.between?(origin.x, width)
    end

    def position_y_valid?(y)
      y.between?(origin.y, height)
    end


end
