class Table

  def initialize(max_x_position = 4, max_y_position = 4)
    @min_x_position = 0
    @min_y_position = 0
    @max_x_position = max_x_position
    @max_y_position = max_y_position
  end

  def positions_valid?(x, y)
    x_position_valid?(x) && y_position_valid?(y)
  end


  private

    attr_reader :min_x_position, :min_y_position, :max_x_position, :max_y_position

    def x_position_valid?(x)
      x.to_i.between?(min_x_position, max_x_position)
    end

    def y_position_valid?(y)
      y.to_i.between?(min_y_position, max_y_position)
    end

end
