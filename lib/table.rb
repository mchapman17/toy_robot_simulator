class Table

  def initialize(width: 4, height: 4, hole: nil)
    @origin = Position.new(x: 0, y: 0)
    @width = width
    @height = height
    @hole = hole
  end

  def positions_valid?(x, y)
    position_x_valid?(x) && position_y_valid?(y) && !position_in_hole?(x, y)
  end


  private

    attr_reader :origin, :width, :height, :hole

    def position_x_valid?(x)
      x.between?(origin.x, width)
    end

    def position_y_valid?(y)
      y.between?(origin.y, height)
    end

    def position_in_hole?(x, y)
      hole && position_x_in_hole?(x) && position_y_in_hole?(y)
    end

    def position_x_in_hole?(x)
      x.between?(hole.origin.x, hole.origin.x + width)
    end

    def position_y_in_hole?(y)
      y.between?(hole.origin.y, hole.origin.y + hole.height)
    end

end
