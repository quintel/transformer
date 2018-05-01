require 'spec_helper'

module Transformer
  RSpec.describe Caster::Exporter do
    let(:dataset_cast) {
      DatasetCast.new(
        area: 'ameland',
        inputs: {
          households_final_demand_electricity_households_final_demand_for_hot_water_electricity_parent_share: 0.25
        }
      )
    }
    let(:template) { Caster::Template.new }
    let(:result)  { Caster::Exporter.new(dataset_cast, template).analyze }

    it 'exports to a template' do
      expect(result).to be_a(Caster::Template)
    end

    it 'runs the sparse graph queries' do
      expect(result
        .get(:graph_values)
        .fetch('households_final_demand_electricity')).to eq({'demand' => 42})
    end

    it 'converts one-to-one parent-shares by dividing these by 100' do
      expect(result
        .get(:graph_values)
        .fetch('households_final_demand_electricity-households_final_demand_for_hot_water_electricity@electricity')).to eq({'parent_share' => 0.25 })
    end
  end
end
