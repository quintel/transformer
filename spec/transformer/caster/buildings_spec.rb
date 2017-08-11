require 'spec_helper'

describe Transformer::Caster::Buildings do
  let(:dataset) { Atlas::Dataset.find(:nl) }
  let(:graph) { Turbine::Graph.new }
  let(:analyzer) { Transformer::Caster::Buildings.analyze(dataset, graph, {
    building_area: 100
  }, {}) }

  # Stub graph nodes demand; every node demand = 5.0
  before do
    expect(graph).to receive(:node)
      .at_least(:once)
      .and_return(OpenStruct.new(demand: 5.0))
  end

  # building_area = 100m2
  # 100 * 1223 = 122300 units
  #
  # nl has 392385 buildings
  #
  # ratio = 122300 / 392385 = 0.31168
  #
  # all demands are 5 so all demands turn into 5 * 0.31168 =~ 1.5584
  #
  it 'analyzes buildings' do
    expect(analyzer.fetch(:buildings_useful_demand_for_space_heating)
      ).to eq(1.5585256322032428)
  end
end
