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

		case command
			when "PLACE"
				args = input.partition(" ").last
				args.gsub!(/\s+/,'')
				unless args.split(",").length == 3
					puts "PLACE must have three arguments"
					return
				end
				x, y, direction = args.split(",")
				unless Robot::DIRECTIONS.include?(direction)
					puts "PLACE must have a valid direction (NORTH|EAST|SOUTH|WEST)"
					return
				end
				@robot.place(x,y)
				@robot.face(direction)
			when "MOVE"
				puts "I refuse to fall to destruction!" unless @robot.move
			when "LEFT"
				@robot.turn_left
			when "RIGHT"
				@robot.turn_right
			when "REPORT"
				@robot.report
		end
	end


	private

		def valid_command?(input)
			VALID_COMMANDS.include?(command)
		end

end