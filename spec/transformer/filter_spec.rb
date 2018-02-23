require 'spec_helper'

module Transformer
  describe Filter do
    it "filter's values" do
      filter = Filter.call(number_of_residences: 500)

      expect(filter).to eq(number_of_residences: 500, graph_methods: {})
    end

    it "rejects empty values" do
      filter = Filter.call(number_of_residences: 500, test: nil)

      expect(filter).to eq(number_of_residences: 500, graph_methods: {})
    end

    it "symbolizes keys" do
      filter = Filter.call('number_of_residences' => 500, 'test' => nil)

      expect(filter).to eq(number_of_residences: 500, graph_methods: {})
    end

    it "filter's values including graph methods" do
      filter = Filter.call(
        number_of_residences: 500,
        households_final_demand_electricity_demand: 100
      )

      expect(filter).to eq(
        number_of_residences: 500,
        graph_methods: {
          households_final_demand_electricity_demand: 100
        }
      )
    end
  end
end
