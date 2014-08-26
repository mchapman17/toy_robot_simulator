
require_relative '../lib/simulator.rb'
require_relative '../lib/table.rb'
require_relative '../lib/robot.rb'

begin
  simulator = Simulator.new

  puts 'Welcome to the Toy Robot Simulator!'
  puts 'Valid commands are PLACE X,Y,(NORTH|EAST|SOUTH|WEST), MOVE, LEFT, RIGHT, REPORT'
  puts 'Press CTRL+C to exit'

  input = STDIN.gets
  while input
    simulator.process(input)
    input = STDIN.gets
  end
rescue Interrupt
  puts "\nThanks for playing!"
rescue StandardError => err
  puts "\nA malfunction has occurred: #{err.message}"
end
