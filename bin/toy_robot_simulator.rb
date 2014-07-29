
require '../lib/simulator.rb'
require '../lib/table.rb'
require '../lib/robot.rb'

simulator = Simulator.new

puts "Welcome to the Toy Robot Simulator!"
puts "Valid commands are PLACE X,Y,(NORTH|EAST|SOUTH|WEST), MOVE, LEFT, RIGHT, REPORT"
puts "Press CTRL+C to exit"

begin
	input = STDIN.gets
	while input
		simulator.process(input)
		input = STDIN.gets
	end
rescue Interrupt
	puts "\nThanks for playing!"
rescue StandardError => err
	puts "A malfunction has occurred: #{err.message}"
end

