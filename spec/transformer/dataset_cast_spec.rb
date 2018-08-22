# frozen_string_literal: true

require 'spec_helper'

module Transformer
  describe DatasetCast do
    let(:dataset_cast) { DatasetCast.new(attributes) }

    context 'with an auto-created Float area attribute' do
      let(:attributes) do
        {
          number_of_residences: 100,
          inputs: { agriculture_useful_demand_electricity_demand: 5.0 }
        }
      end

      it 'sets the area attribute' do
        expect(dataset_cast.number_of_residences).to eq(100)
      end

      it 'initializes a dataset cast' do
        expect(dataset_cast.inputs.agriculture_useful_demand_electricity_demand)
          .to eq(5.0)
      end

      it 'is valid' do
        expect(dataset_cast).to be_valid
      end
    end

    context 'with an auto-created Integer area attribute' do
      let(:attributes) { { number_of_residences: 100, analysis_year: 2016 } }

      it 'sets the Integer area attribute' do
        expect(dataset_cast.analysis_year).to eq(2016)
      end

      it 'is valid' do
        expect(dataset_cast).to be_valid
      end
    end
  end
end
