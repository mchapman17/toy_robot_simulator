require 'spec_helper'

describe Simulator do 

	before do
		@simulator = Simulator.new
	end

	describe "when given valid input" do

		it "places the robot" do
			@simulator.process("PLACE 1,1,NORTH")
			expect { @simulator.process("REPORT") }.to output("I am at position 1,1 facing NORTH\n").to_stdout
		end

		it "moves the robot" do
			@simulator.process("PLACE 1,1,NORTH")
			@simulator.process("MOVE")
			expect { @simulator.process("REPORT") }.to output("I am at position 1,2 facing NORTH\n").to_stdout
		end

		it "turns the robot left" do
			@simulator.process("PLACE 1,1,NORTH")
			@simulator.process("LEFT")
			expect { @simulator.process("REPORT") }.to output("I am at position 1,1 facing WEST\n").to_stdout
		end

		it "turns the robot right" do
			@simulator.process("PLACE 1,1,NORTH")
			@simulator.process("RIGHT")
			expect { @simulator.process("REPORT") }.to output("I am at position 1,1 facing EAST\n").to_stdout
		end

		it "ignores any commands received prior to a PLACE" do			
			expect { 
				@simulator.process("LEFT")
				@simulator.process("MOVE")
				@simulator.process("PLACE 3,4,WEST")
				@simulator.process("REPORT") 
			}.to output("I am at position 3,4 facing WEST\n").to_stdout
		end
	end

	describe "when given invalid input" do

		it "doesn't place the robot when given invalid coordinates" do
			expect { @simulator.process("PLACE 9,7,NORTH") }.to output(/Invalid PLACE command/).to_stdout
		end

		it "doesn't place the robot when given an invalid direction" do
			expect { @simulator.process("PLACE 1,1,INVALID") }.to output(/Invalid PLACE command/).to_stdout
		end

		it "ignores moves that would make the robot fall" do
			@simulator.process("PLACE 1,4,NORTH")
			expect { 
				@simulator.process("MOVE")
				@simulator.process("REPORT") 
			}.to output("I am at position 1,4 facing NORTH\n").to_stdout
		end
	end
	
end