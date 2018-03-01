require 'spec_helper'

module Transformer
  describe DatasetCast do
    let(:dataset_cast) { DatasetCast.new(attributes) }

    describe "valid cast" do
      let(:attributes) {
        { number_of_residences: 100,
          graph_methods: {
            agriculture_useful_demand_electricity_demand: 5.0
          }
        }
      }

      it "initializes a dataset cast" do
        expect(
          dataset_cast.graph_methods.agriculture_useful_demand_electricity_demand).to eq(5.0)
      end

      it "is valid" do
        expect(dataset_cast).to be_valid
      end
    end
  end
end
