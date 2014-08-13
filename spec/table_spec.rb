require 'spec_helper'

describe Table do

  before do
    @table = Table.new
  end

  describe "initial state" do

    it "sets the minimum X position allowed" do
      expect(@table.min_x_position).to eq(0)
    end

    it "sets the minimum Y position allowed" do
      expect(@table.min_y_position).to eq(0)
    end   

    it "sets the maximum X position if not specified" do
      expect(@table.max_x_position).to be >= 0
    end

    it "sets the maximum Y position if not specified" do
      expect(@table.max_y_position).to be >= 0
    end

    it "sets the maximum X position allowed if specified" do
      expect(Table.new(2,4).max_x_position).to eq(2)
    end

    it "sets the maximum Y position allowed if specified" do
      expect(Table.new(1,3).max_y_position).to eq(3)
    end
  end

  describe "#x_position_valid?(x)" do

    it "returns true if X is within range" do
      expect(Table.new(4,2).x_position_valid?(1)).to be true
    end

    it "returns false if X is outside the range" do
      expect(Table.new(3,1).x_position_valid?(4)).to be false
    end
  end

  describe "#y_position_valid?(y)" do

    it "returns true if Y is within range" do
      expect(Table.new(5,4).y_position_valid?(3)).to be true
    end

    it "returns false if Y is outside the range" do
      expect(Table.new(2,6).y_position_valid?(7)).to be false
    end
  end

end