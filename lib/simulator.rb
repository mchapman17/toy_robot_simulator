class Simulator
	
	VALID_COMMANDS = %W(PLACE MOVE LEFT RIGHT REPORT)

	def initialize
		@table = Table.new
		@robot = Robot.new(@table)
	end

	def process(input)
		return if input.strip.empty?

		command = input.split(" ").first
		unless valid_command?(command)
			puts "Invalid command '#{command}'" 
			return 
		end

		if command == "PLACE"
			args = input.partition(" ").last.gsub(/\s+/,'') # get everything after the PLACE command and remove whitespace
			return unless valid_place_args?(args)
			x, y, direction = args.split(",")
		end

		case command
			when "PLACE"
				@robot.place(x,y)
				@robot.face(direction)
				nil
			when "MOVE"
				@robot.move
				nil
			when "LEFT"
				@robot.turn_left
				nil
			when "RIGHT"
				@robot.turn_right
				nil
			when "REPORT"
				puts @robot.report
		end
	end


	private

		def valid_command?(command)
			VALID_COMMANDS.include?(command)
		end

		def valid_place_args?(args)
			x, y, direction = args.split(",")
			if @table.x_position_valid?(x) && @table.y_position_valid?(y) && @robot.direction_valid?(direction)
				true
			else
				puts "Invalid PLACE command. Must be in the form PLACE X(0-#{@table.max_x_position}),Y(0-#{@table.max_y_position}),(#{Robot::DIRECTIONS.join("|")})"
			end
		end

end