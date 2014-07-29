class Simulator
	
	VALID_COMMANDS = %W(PLACE MOVE LEFT RIGHT REPORT)

	def initialize
		@table = Table.new
		@robot = Robot.new(@table)
	end

	def process(input)
		return if input.strip.empty?

		command = input.split(" ").first
		puts "Invalid command '#{command}'" && return unless valid_command?(command)

		if command == "PLACE"
			args = input.partition(" ").last.gsub(/\s+/,'') # get everything after the PLACE command and remove whitespace
			return unless valid_place_args?(args)
			x, y, direction = args.split(",")
		end

		case command
			when "PLACE"
				@robot.place(x,y)
				@robot.face(direction)
			when "MOVE"
				puts "I refuse to fall to destruction!" unless @robot.move
			when "LEFT"
				@robot.turn_left
			when "RIGHT"
				@robot.turn_right
			when "REPORT"
				puts @robot.report
		end
	end


	private

		def valid_command?(input)
			VALID_COMMANDS.include?(command)
		end

		def valid_place_args?(args)
			valid_number_of_place_args?(args) && valid_direction?(args)
		end

		def valid_number_of_args?(args)
			if args.split(",").length == 3
				true
			else
				puts "PLACE must have three arguments"
				false
			end
		end

		def valid_direction?(args)
			direction = args.split(",").last
			if Robot::DIRECTIONS.include?(direction)
				true
			else
				puts "PLACE must have a valid direction (NORTH|EAST|SOUTH|WEST)"
				false
			end
		end

end