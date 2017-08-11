require 'spec_helper'

describe Transformer::Caster::Supply do
  let(:dataset)  { Atlas::Dataset::Derived.find(:ameland) }
  let(:analyzer) { Transformer::Caster::Supply.new(dataset, nil, edits, {}) }

  describe "analyzes supply related inputs" do
    let(:edits) { {
      'number_of_energy_heater_for_heat_network_network_gas' => 500
    } }

    it 'analyzes' do
      expect(analyzer.analyze).to eq({
        'number_of_energy_heater_for_heat_network_network_gas' => 500
      })
    end
  end
end
