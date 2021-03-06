require 'spec_helper'

describe Table do

  describe "#positions_valid?(x, y)" do

    context "with default positions" do

      let(:table) { Table.new }

      it "returns true if the X and Y positions are within range" do
        expect(table.positions_valid?(0, 0)).to be true
      end

      it "returns true if the X and Y positions are within range" do
        expect(table.positions_valid?(4, 4)).to be true
      end

      it "returns false if the X and Y positions are not within range" do
        expect(table.positions_valid?(5, 5)).to be false
      end
    end

    context "with positions specified" do

      it "returns true if the X and Y positions are within range" do
        expect(Table.new(width: 4, height: 2).positions_valid?(1, 1)).to be true
      end

      it "returns false if the X position is outside the range" do
        expect(Table.new(width: 3, height: 1).positions_valid?(4, 1)).to be false
      end

      it "returns false if the Y position is outside the range" do
        expect(Table.new(width: 3, height: 1).positions_valid?(1, 4)).to be false
      end
    end

    describe "with a hole specified" do

      let(:table) { Table.new(width: 5, height: 5, hole: hole) }
      let(:hole) { Hole.new(origin: Position.new(x: 1, y: 2), width: 1, height: 1) }

      it "returns true if the X and Y positions are within range and not in the hole" do
        expect(table.positions_valid?(0, 0)).to be true
      end

      it "returns false if the X and Y positions are within range and in the hole" do
        expect(table.positions_valid?(2, 3)).to be false
      end


    end
  end

end
