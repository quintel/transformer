require 'spec_helper'
require 'support/graph'

describe Transformer::Caster do
  let(:dataset_cast) { Transformer::DatasetCast.new(
    Transformer::Filter.call(inputs)
  ) }
  let(:caster) { Transformer::Caster.cast(dataset_cast) }

  describe "faulty information" do
    describe "empty" do
      let(:inputs) { { area: 'ameland' } }

      it 'can only cast with a complete set of data' do
        expect{ caster }.to raise_error(ArgumentError)
      end
    end

    describe "empty" do
      let(:inputs) { {'area' => 'ameland', 'non_existing_key' => 5.0 } }

      it 'can only cast with the correct keys' do
        expect { caster }.to raise_error(ArgumentError)
      end
    end
  end

  describe "correct" do
    let(:inputs) {
      {
        'area'                               => 'ameland',
        'gas_consumption'                    => 5.0,
        'electricity_consumption'            => 5.0,
        'roof_surface_available_for_pv'      => 5.0,
        'number_of_cars'                     => 5.0,
        'number_of_residences'               => 5.0,
        'number_of_residences_with_solar_pv' => 5.0,
        'number_of_inhabitants'              => 5.0,
        'percentage_of_apartments'     => 10,
        'building_area'                      => 24
      }
    }

    it 'spews out the correct area attributes of a local dataset' do
      caster.slice(
        'number_of_residences',
        'number_of_cars',
        'number_of_inhabitants'
      ).each do |key, val|
        expect(analyzer[:area][key.to_sym]).to eq(val)
      end
    end

    it 'determines the correct number_of_apartments' do
      expect(caster[:area][:number_of_apartments]).to eq(0.5)
    end

    # Exporter spec #2
    describe "a key from etlocal that belongs to a share" do
      let(:inputs) { {
        'area' => 'ameland',
        'number_of_residences' => 5.0,
        'households_final_demand_electricity_households_final_demand_for_hot_water_electricity_parent_share' => 0.2
      } }

      it 'flows through to the end' do
        expect(caster
          .fetch(:graph_values)
          .fetch('households_final_demand_electricity-households_final_demand_for_hot_water_electricity@electricity')
          .fetch('parent_share')
        ).to eq(0.2)
      end
    end
  end
end
