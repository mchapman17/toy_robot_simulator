require 'spec_helper'

describe Robot do

	before do
		@table = Table.new(4,4)
		@robot = Robot.new(@table)
	end

	describe "initial state" do

		it "sets the table" do
			expect(@robot.table).to eq(@table)
		end
	end

	describe "#place(x,y)" do

		describe "placing the robot in range" do

			it "sets the robot's X position" do
				@robot.place(1,2)
				expect(@robot.position_x).to eq(1)
			end

			it "sets the robot's Y position" do
				@robot.place(1,2)
				expect(@robot.position_y).to eq(2)
			end	
		end

		describe "placing the robot out of range" do

			it "doesn't change the robot's X position" do
				@robot.place(5,0)
				expect(@robot.position_x).to be_nil
			end	

			it "doesn't change the robot's Y position" do
				@robot.place(0,5)
				expect(@robot.position_y).to be_nil
			end	
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

		it "sets the direction the robot is facing when given a valid direction" do
			@robot.face("SOUTH")
			expect(@robot.facing).to eq("SOUTH")
		end

		it "doesn't set the direction the robot is facing when given an invalid direction" do
			@robot.face("INVALID")
			expect(@robot.facing).to be_nil
		end	
	end

	describe "#turn_left" do

		it "turns the robot left if it is facing a direction" do
			@robot.face("NORTH")
			@robot.turn_left
			expect(@robot.facing).to eq("WEST")
		end

		it "doesn't set the direction the robot is facing if it isn't facing a direction" do
			@robot.turn_left
			expect(@robot.facing).to be_nil
		end
	end

	describe "#report" do

		it "outputs the robot's position and direction it is facing if it has been placed and is facing a direction" do
			@robot.place(2,3)
			@robot.face("WEST")
			expect(@robot.report).to eq("I am at #{@robot.position_x},#{@robot.position_y} - facing #{@robot.facing}")
		end

		it "outputs nothing if the robot hasn't been placed" do
			@robot.face("SOUTH")
			expect(@robot.report).to be_nil
		end

		it "outputs nothing if the robot isn't facing a direction" do
			@robot.place(1,1)
			expect(@robot.report).to be_nil
		end
	end
	

end