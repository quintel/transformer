require 'spec_helper'

describe Transformer::Caster::Industry do
  let(:dataset)  { Atlas::Dataset::Derived.find(:ameland) }
  let(:analyzer) {
    Transformer::Caster::Industry.new(
      dataset_cast,
      Transformer::Caster::Template.new
    )
  }

  describe "toggling off" do
    let(:dataset_cast) { Transformer::DatasetCast.new(
      has_industry: false,
      graph_methods: {
        industry_useful_demand_for_chemical_aggregated_industry_demand: 5.0
      }
    ) }

    it 'all industry related initializer inputs' do
      expect(analyzer.analyze
        .get(:graph_values)
        .fetch(:industry_useful_demand_for_chemical_aggregated_industry)
        .fetch('demand')
      ).to eq(0)
    end
  end

  describe "toggling on" do
    let(:dataset_cast) { Transformer::DatasetCast.new(
      has_industry: true,
      graph_methods: {
        industry_useful_demand_for_chemical_aggregated_industry_demand: 5.0
      }
    ) }

    it 'all industry related initializer inputs' do
      expect(analyzer.analyze
        .get(:graph_values)
        .fetch(:industry_useful_demand_for_chemical_aggregated_industry)
        .fetch('demand')
      ).to eq(5.0)
    end
  end
end
