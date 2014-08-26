class Robot

  attr_accessor :table, :position_x, :position_y, :facing

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  def initialize(table)
    @table = table
  end

  def place(x, y)
    return unless table_positions_valid?(x, y)
    self.position_x = x.to_i
    self.position_y = y.to_i
  end

  def placed?
    !position_x.nil? && !position_y.nil?
  end

  def position
    [position_x, position_y] if placed?
  end

  def face(direction)
    self.facing = direction if direction_valid?(direction)
  end

  def direction_valid?(direction)
    DIRECTIONS.include?(direction)
  end

  def move
    return unless placed? && facing?
    case facing
      when 'NORTH'
        self.position_y += 1 if table_positions_valid?(position_x, position_y + 1)
      when 'EAST'
        self.position_x += 1 if table_positions_valid?(position_x + 1, position_y)
      when 'SOUTH'
        self.position_y -= 1 if table_positions_valid?(position_x, position_y - 1)
      when 'WEST'
        self.position_x -= 1 if table_positions_valid?(position_x - 1, position_y)
    end
  end

  def turn_left
    self.facing = DIRECTIONS.rotate(DIRECTIONS.index(facing) - 1).first if facing?
  end

  def turn_right
    self.facing = DIRECTIONS.rotate(DIRECTIONS.index(facing) + 1).first if facing?
  end

  def report
    "I am at position #{position_x},#{position_y} facing #{facing}" if placed? && facing?
  end


  private

    def facing?
      !facing.nil?
    end

    def table_positions_valid?(x, y)
      table.positions_valid?(x, y)
    end

end
