class Simulator
	
	def initialize
		@table = Table.new
		@robot = Robot.new(@table)
	end

	def process(input)
		return if input.strip.empty?

		command = input.split(" ").first

		case command
			when "PLACE"
				args = input.partition(" ").last
				args.gsub!(/\s+/,'')
				unless args.split(",").length == 3
					puts "Invalid PLACE arguments"
					return
				end
				x, y, direction = args.split(",")
				@robot.place(x,y)
				@robot.face(direction)
			when "MOVE"
				puts "move"
			when "LEFT"

			when "RIGHT"

			when "REPORT"

			else
				puts "Invalid command '#{command}'"
		end
	end



end