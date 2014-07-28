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

		it "sets the maximum X position allowed to 4 if not specified" do
			expect(@table.max_x_position).to eq(4)
		end

		it "sets the maximum Y position allowed to 4 if not specified" do
			expect(@table.max_y_position).to eq(4)
		end

		it "sets the maximum X position allowed if specified" do
			expect(Table.new(2,2).max_x_position).to eq(2)
		end

		it "sets the maximum Y position allowed if specified" do
			expect(Table.new(3,3).max_x_position).to eq(3)
		end
	end

end