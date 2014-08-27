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
        expect(Table.new(max_x_position: 4, max_y_position: 2).positions_valid?(1, 1)).to be true
      end

      it "returns false if the X position is outside the range" do
        expect(Table.new(max_x_position: 3, max_y_position: 1).positions_valid?(4, 1)).to be false
      end

      it "returns false if the Y position is outside the range" do
        expect(Table.new(max_x_position: 3, max_y_position: 1).positions_valid?(1, 4)).to be false
      end
    end

    context "with a hole specified" do

      let(:table) { Table.new(max_x_position: 5, max_y_position: 5,
                              hole_min_x_position: 2, hole_min_y_position: 3,
                              hole_max_x_position: 1, hole_max_y_position: 2) }

      it "returns true if the X AND Y positions are within range and not in the hole" do
        expect(table.positions_valid?(0, 0)).to be true
      end

      it "returns true if the X AND Y positions are within range and not in the hole" do
        expect(table.positions_valid?(2, 3)).to be false
      end


    end
  end

end
