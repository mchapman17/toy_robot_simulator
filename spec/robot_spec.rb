require 'spec_helper'

describe Robot do

	before do
		@table = Table.new
		@robot = Robot.new(@table)
	end

	describe "initial state" do

		it "sets the table" do
			expect(@robot.table).to eq(@table)
		end
	end

	describe "#place(x,y)" do

		it "sets the robot's X position" do
			@robot.place(1,2)
			expect(@robot.position_x).to eq(1)
		end

		it "sets the robot's Y position" do
			@robot.place(1,2)
			expect(@robot.position_y).to eq(2)
		end	

		it "disallows placing the robot out of X range" do

		end	
	end

	describe "#placed?" do

		it "is false initially" do
			expect(@robot.placed?).to be false
		end

		it "is true after the robot has been placed" do
			@robot.place(0,0)
			expect(@robot.placed?).to be true
		end
	end

	describe "#face(direction)" do

		
	end
	

end