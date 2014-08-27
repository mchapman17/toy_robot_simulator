class NullHole
  # Avdi Grimm post - null object pattern - naught
end

class Hole

  def initialize(min_x_position:, min_y_position:, max_x_position:, max_y_position:)
    @min_x_position = min_x_position
    @min_y_position = min_y_position
    @max_x_position = max_x_position
    @max_y_position = max_y_position
  end

end


class Table

  def initialize(min_x_position: 0, min_y_position: 0, max_x_position: 4, max_y_position: 4, hole: NullHole.new)
    @min_x_position = min_x_position
    @min_y_position = min_y_position
    @max_x_position = max_x_position
    @max_y_position = max_y_position
    @hole = hole
  end

  def positions_valid?(x, y)
    x_position_valid?(x) && y_position_valid?(y) && !position_in_hole?(x, y)
  end


  private

    attr_reader :min_x_position, :min_y_position, :max_x_position, :max_y_position,
                :hole_min_x_position, :hole_min_y_position, :hole_max_x_position, :hole_max_y_position

    def x_position_valid?(x)
      x.between?(min_x_position, max_x_position)
    end

    def y_position_valid?(y)
      y.between?(min_y_position, max_y_position)
    end

    def position_in_hole?(x, y)
      x.between?(min_x_position + hole_min_x_position, min_x_position + hole_min_x_position + hole_max_x_position) &&
        y.between?(min_y_position + hole_min_y_position, min_y_position + hole_min_y_position + hole_max_y_position)
    end


end
