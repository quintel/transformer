require 'spec_helper'

describe Transformer::Caster::Assumptions do
  let(:dataset) { Atlas::Dataset::Derived.find(:ameland) }

  let(:analyzer) {
    Transformer::Caster::Base.new(dataset, nil, {}, {})
  }

  it 'asks the efficiency of a converter' do
    expect(analyzer
      .efficiency_for(:test_carrier)).to eq(0.788659793814433)
  end

  it 'asks the efficiency of a heat pump' do
    expect(analyzer
      .efficiency_for(:test_heatpump)).to eq(3.000000000000003)
  end

  it 'asks the efficiency of a static default' do
    expect(analyzer
      .efficiency_for(:test_static)).to eq(0.5)
  end
end
