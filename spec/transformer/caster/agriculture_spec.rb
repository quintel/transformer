require 'spec_helper'

describe Transformer::Caster::Agriculture do
  let(:dataset)  { Atlas::Dataset::Derived.find(:ameland) }

  let(:analyzer) {
    Transformer::Caster::Agriculture.new(
      dataset_cast, Transformer::Caster::Template.new)
  }

  describe "toggling off" do
    let(:dataset_cast) { Transformer::DatasetCast.new(
      has_agriculture: false,
      graph_methods: {
        agriculture_useful_demand_electricity_demand: 5.0
      }
    ) }

    it 'all industry related initializer inputs' do
      expect(analyzer.analyze
        .get(:graph_values)
        .fetch(:agriculture_useful_demand_electricity)
        .fetch('demand')
      ).to eq(0)
    end
  end

  describe "toggling on" do
    let(:dataset_cast) { Transformer::DatasetCast.new(
      has_agriculture: true,
      graph_methods: {
        agriculture_useful_demand_electricity_demand: 5.0
      }
    ) }

    it 'all industry related initializer inputs' do
      expect(analyzer.analyze
        .get(:graph_values)
        .fetch(:agriculture_useful_demand_electricity)
        .fetch('demand')
      ).to eq(5.0)
    end
  end
end
