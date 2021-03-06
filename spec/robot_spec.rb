require 'spec_helper'

describe Robot do

  before do
    @table = Table.new(width: 4, height: 4)
    @robot = Robot.new(@table)
  end

  describe "initial state" do

    it "sets the table" do
      expect(@robot.table).to eq(@table)
    end
  end

  describe "#place(x, y)" do

    context "when placing the robot in range" do

      it "sets the robot's position" do
        @robot.place(1, 2)
        expect(@robot.position).to be_kind_of(Position)
      end
    end

    context "when placing the robot out of range" do

      it "doesn't set the robot's position" do
        @robot.place(5, 0)
        expect(@robot.position).to be_nil
      end
    end
  end

  describe "#placed?" do

    it "is false initially" do
      expect(@robot.placed?).to be false
    end

    it "is true after the robot has been placed" do
      @robot.place(0, 0)
      expect(@robot.placed?).to be true
    end
  end

  describe "#face(direction)" do

    it "sets the direction the robot is facing when given a valid direction" do
      @robot.face('SOUTH')
      expect(@robot.facing).to eq('SOUTH')
    end

    it "doesn't set the direction the robot is facing when given an invalid direction" do
      @robot.face('INVALID')
      expect(@robot.facing).to be_nil
    end
  end

  describe "#direction_valid?(direction)" do

    it "returns true if the direction is valid" do
      expect(@robot.direction_valid?('EAST')).to be true
    end

    it "returns true if the direction is valid" do
      expect(@robot.direction_valid?('INVALID')).to be false
    end
  end

  describe "#move" do

    context "when the move is valid" do

      it "moves the robot north one unit" do
        @robot.place(0, 0)
        @robot.face('NORTH')
        @robot.move
        expect(@robot.coordinates).to eq([0, 1])
      end

      it "moves the robot east one unit" do
        @robot.place(0, 0)
        @robot.face('EAST')
        @robot.move
        expect(@robot.coordinates).to eq([1, 0])
      end

      it "moves the robot south one unit" do
        @robot.place(3, 3)
        @robot.face('SOUTH')
        @robot.move
        expect(@robot.coordinates).to eq([3, 2])
      end

      it "moves the robot west one unit" do
        @robot.place(4, 2)
        @robot.face('WEST')
        @robot.move
        expect(@robot.coordinates).to eq([3, 2])
      end
    end

    context "when the move is not valid" do

      it "doesn't move the robot north" do
        @robot.place(4, 4)
        @robot.face('NORTH')
        @robot.move
        expect(@robot.coordinates).to eq([4, 4])
      end

      it "doesn't move the robot east" do
        @robot.place(4, 0)
        @robot.face('EAST')
        @robot.move
        expect(@robot.coordinates).to eq([4, 0])
      end

      it "doesn't move the robot south" do
        @robot.place(0, 0)
        @robot.face('SOUTH')
        @robot.move
        expect(@robot.coordinates).to eq([0, 0])
      end

      it "doesn't move the robot west" do
        @robot.place(0, 2)
        @robot.face('WEST')
        @robot.move
        expect(@robot.coordinates).to eq([0, 2])
      end
    end

  end

  describe "#turn_left" do

    it "turns the robot left if it is placed and facing a direction" do
      @robot.place(0, 0)
      @robot.face('NORTH')
      @robot.turn_left
      expect(@robot.facing).to eq('WEST')
    end

    it "doesn't set the direction if the robot isn't facing a direction" do
      @robot.place(0, 0)
      @robot.turn_left
      expect(@robot.facing).to be_nil
    end
  end

  describe "#turn_right" do

    it "turns the robot right if it is facing a direction" do
      @robot.face('EAST')
      @robot.turn_right
      expect(@robot.facing).to eq('SOUTH')
    end

    it "doesn't set the direction if the robot isn't facing a direction" do
      @robot.turn_right
      expect(@robot.facing).to be_nil
    end
  end

  describe "#report" do

    it "outputs the robot's position and direction it is facing" do
      @robot.place(2, 3)
      @robot.face('WEST')
      expect { @robot.report }.to output(/2/).to_stdout
      expect { @robot.report }.to output(/3/).to_stdout
      expect { @robot.report }.to output(/WEST/).to_stdout
    end

    it "outputs nothing if the robot hasn't been placed" do
      @robot.face('SOUTH')
      expect { @robot.report }.to output("").to_stdout
    end

    it "outputs nothing if the robot isn't facing a direction" do
      @robot.place(1, 1)
      expect { @robot.report }.to output("").to_stdout
    end
  end

end
