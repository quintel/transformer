require 'spec_helper'

module Transformer
  describe DatasetCast do
    it "initializes a dataset cast" do
      cast = DatasetCast.new(
        graph_methods: {
          agriculture_useful_demand_electricity_demand: 5.0
        }
      )

      expect(
        cast.graph_methods.agriculture_useful_demand_electricity_demand).to eq(5.0)
    end
  end
end
