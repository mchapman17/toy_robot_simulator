class Robot

  extend Forwardable

  attr_reader :table, :position, :facing

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  delegate :coordinates => :position

  def initialize(table)
    @table = table
  end

  def place(x, y)
    return unless table_positions_valid?(x, y)
    self.position = Position.new(x: x, y: y)
  end

  def placed?
    !position.nil?
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
        move_north if table_positions_valid?(position.x, position.y + 1)
      when 'EAST'
        move_east if table_positions_valid?(position.x + 1, position.y)
      when 'SOUTH'
        move_south if table_positions_valid?(position.x, position.y - 1)
      when 'WEST'
        move_west if table_positions_valid?(position.x - 1, position.y)
    end
  end

  def turn_left
    self.facing = DIRECTIONS.rotate(DIRECTIONS.index(facing) - 1).first if facing?
  end

  def turn_right
    self.facing = DIRECTIONS.rotate(DIRECTIONS.index(facing) + 1).first if facing?
  end

  def report
    puts "I am at position #{position.x},#{position.y} facing #{facing}" if placed? && facing?
  end


  private

    attr_writer :position, :facing

    def facing?
      !facing.nil?
    end

    def table_positions_valid?(x, y)
      table.positions_valid?(x, y)
    end

    def move_north
      self.position = Position.new(x: position.x, y: position.y + 1)
    end

    def move_east
      self.position = Position.new(x: position.x + 1, y: position.y)
    end

    def move_south
      self.position = Position.new(x: position.x, y: position.y - 1)
    end

    def move_west
      self.position = Position.new(x: position.x - 1, y: position.y)
    end

end
