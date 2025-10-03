require 'spec_helper'

module Transformer
  describe Filter do
    it 'filters values' do
      filter = Filter.call(present_number_of_residences: 500)

      expect(filter).to eq(present_number_of_residences: 500, inputs: {})
    end

    it 'rejects empty values' do
      filter = Filter.call(present_number_of_residences: 500, test: nil)

      expect(filter).to eq(present_number_of_residences: 500, inputs: {})
    end

    it 'symbolizes keys' do
      filter = Filter.call('present_number_of_residences' => 500, 'test' => nil)

      expect(filter).to eq(present_number_of_residences: 500, inputs: {})
    end

    it 'filters values including graph methods' do
      filter = Filter.call(
        present_number_of_residences: 500,
        households_final_demand_electricity_demand: 100
      )

      expect(filter).to eq(
        present_number_of_residences: 500,
        inputs: {
          households_final_demand_electricity_demand: 100
        }
      )
    end
  end
end
