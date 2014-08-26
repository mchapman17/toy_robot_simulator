require 'spec_helper'

describe Table do

  describe "#positions_valid?(x, y)" do

    context "with default positions" do

      let(:table) { Table.new }

      it "returns true if the X AND Y positions are within range" do
        expect(table.positions_valid?(0, 0)).to be true
      end

      it "returns true if the X AND Y positions are within range" do
        expect(table.positions_valid?(4, 4)).to be true
      end

      it "returns false if the X AND Y positions are not within range" do
        expect(table.positions_valid?(5, 5)).to be false
      end
    end

    context "with positions specified" do

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

end
