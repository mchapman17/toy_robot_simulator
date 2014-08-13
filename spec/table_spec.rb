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
      expect(Table.new(2, 4).max_x_position).to eq(2)
    end

    it "sets the maximum Y position allowed if specified" do
      expect(Table.new(1, 3).max_y_position).to eq(3)
    end
  end

  describe "#positions_valid?(x, y)" do

    it "returns true if the X AND Y positions are within range" do
      expect(Table.new(4, 2).positions_valid?(1, 1)).to be true
    end

    it "returns false if the X position is outside the range" do
      expect(Table.new(3, 1).positions_valid?(4, 1)).to be false
    end

    it "returns false if the Y position is outside the range" do
      expect(Table.new(3, 1).positions_valid?(1, 4)).to be false
    end
  end

end
