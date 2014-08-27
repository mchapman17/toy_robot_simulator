class Simulator

  VALID_COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT)

  def initialize
    @table = Table.new
    @robot = Robot.new(@table)
  end

  def process(input)
    return if input.strip.empty?

    command = input.split(' ').first
    return unless valid_command?(command)

    if place_command?(command)
      # Get everything after the PLACE command and remove whitespace
      args = input.partition(' ').last.gsub(/\s+/, '')
      return unless valid_place_args?(args)
    end

    case command
      when 'PLACE'
        args = args.split(',')
        x, y, direction = args[0].to_i, args[1].to_i, args[2]
        @robot.place(x, y)
        @robot.face(direction)
      when 'MOVE'
        @robot.move
      when 'LEFT'
        @robot.turn_left
      when 'RIGHT'
        @robot.turn_right
      when 'REPORT'
        puts @robot.report
    end
  end


  private

    def valid_command?(command)
      if VALID_COMMANDS.include?(command)
        true
      else
        puts "Invalid command '#{command}'"
        false
      end
    end

    def place_command?(command)
      command == 'PLACE'
    end

    def valid_place_args?(args)
      x, y, direction = args.split(',')
      if @table.positions_valid?(x.to_i, y.to_i) && @robot.direction_valid?(direction)
        true
      else
        puts 'Invalid PLACE command. Must be in the form ' \
             "PLACE X,Y,(#{Robot::DIRECTIONS.join('|')})"
        false
      end
    end

end
