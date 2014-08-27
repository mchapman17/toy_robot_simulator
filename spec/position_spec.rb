require 'spec_helper'

describe Position do

  describe "initial state" do

    context "with default values" do

      it "sets the X coordinate" do
        expect(Position.new.x).to eq(0)
      end

      it "sets the Y coordinate" do
        expect(Position.new.y).to eq(0)
      end
    end

    context "with sepcified values" do

      it "sets the X coordinate" do
        expect(Position.new(x: 1).x).to eq(1)
      end

      it "sets the Y coordinate" do
        expect(Position.new(y: 3).y).to eq(3)
      end
    end
  end

  describe "#coordinates" do

    it "returns the specified X and Y values" do
      expect(Position.new(x: 1, y: 2).coordinates).to eq [1, 2]
    end
  end

end
