require 'spec_helper'

describe Position do

  describe "#coordinates" do

    context "with default values" do

      let(:position) { Position.new }

      it "returns the default X and Y values" do
        expect(position.coordinates).to eq [0, 0]
      end
    end

    context "with values specified" do

      let(:position) { Position.new(x: 1, y: 2) }

      it "returns the specified X and Y values" do
        expect(position.coordinates).to eq [1, 2]
      end
    end
  end

end
