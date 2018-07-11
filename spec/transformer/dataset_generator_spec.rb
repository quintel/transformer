require 'spec_helper'

module Transformer
  RSpec.describe DatasetGenerator do
    describe 'existing datasets' do
      it 'updates an existing dataset' do
        DatasetGenerator.new(
          area: 'ameland',
          base_dataset: 'nl',
          number_of_residences: 1
        ).generate

        expect(Atlas::Dataset::Derived.find(:ameland).number_of_residences).to eq(1)
      end
    end

    describe 'new datasets' do
      before(:each) do
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
          'households_final_demand_electricity' => {
            'demand' => 42
          },
          'households_final_demand_for_hot_water_electricity' => {
            'demand' => 210
          }
        )
      end
    end
  end
end
