require "spec_helper"

module MarkMegaLotto 
  describe Drawing do
    describe "#draw" do
      let(:draw) { MarkMegaLotto::Drawing.new.draw }

      it "returns an array" do
        expect(draw).to be_a Array
      end

      it "returns an array with 6 elements" do
        expect(draw.size).to eq 8
      end

      it "each element is an integer" do
        draw.each do |d|
          expect(d).to be_a Integer
        end
      end

      it "each element is less than 60" do
        draw.each do |d|
          expect(d).to be < 60
        end
      end
    end

    describe "#reset" do
      it "resets the configuration" do
        MarkMegaLotto.configure do |config|
          config.drawing_count = 20
        end

        MarkMegaLotto.reset

        expect(MarkMegaLotto::Drawing.new.draw.size).to eq 8
      end
    end

    describe "can set the output count" do
      before(:each) do
        MarkMegaLotto.configure do |config|
          config.drawing_count = 10
        end
      end

      it "returns an array with 10 elements" do
        drawing = MarkMegaLotto::Drawing.new.draw
        expect(drawing.size).to eq 10
      end
    end
  end
end
