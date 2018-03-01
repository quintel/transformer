require 'spec_helper'

module Transformer
  RSpec.describe DatasetGenerator do
    before(:all) do
      DatasetGenerator.new(
        area: 'test',
        base_dataset: 'nl',
        number_of_residences: 25,
        number_of_cars: 100,
        # In this test setup this attribute will be multiplied by 5 in order
        # to end up with a demand for households_final_demand_electricity
        # of 25
        etlocal_households_test: 5
      ).generate
    end

    it 'creates a dataset' do
      expect(Atlas::Dataset::Derived.find(:test)).to_not be_nil
    end

    it 'sets the number of residences' do
      dataset = Atlas::Dataset::Derived.find(:test)

      expect(dataset.number_of_residences).to eq(25)
    end

    it 'sets the number of cars' do
      dataset = Atlas::Dataset::Derived.find(:test)

      expect(dataset.number_of_cars).to eq(100)
    end

    it 'sets the final demand of households with a graph method' do
      dataset = Atlas::Dataset::Derived.find(:test)

      expect(dataset.graph_values.values).to eq(
        industry_useful_demand_for_chemical_aggregated_industry: {
          'demand' => 15
        }
      )
    end

    after(:all) do
      DatasetGenerator::Destroyer.call(DatasetCast.new(area: 'test'))
    end
  end
end
