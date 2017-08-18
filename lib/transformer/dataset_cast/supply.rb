module Transformer
  class DatasetCast
    module Supply
      def self.included(model)
        [
          :co_firing_biocoal_share,
          :co_firing_coal_share,
          :energy_distribution_woody_biomass,
          :energy_extraction_crude_oil,
          :energy_extraction_natural_gas,
          :energy_production_bio_ethanol,
          :energy_production_bio_oil,
          :energy_production_biodiesel,
          :energy_production_biogas,
          :energy_production_wood,
          :energy_production_woodpellets,
          :energy_production_woody_biomass,
          :number_of_energy_chp_combined_cycle_network_gas,
          :number_of_energy_chp_supercritical_waste_mix,
          :number_of_energy_chp_ultra_supercritical_coal,
          :number_of_energy_chp_ultra_supercritical_cofiring_coal,
          :number_of_energy_heater_for_heat_network_network_gas,
          :number_of_energy_heater_for_heat_network_waste_mix,
          :number_of_energy_heater_for_heat_network_wood_pellets,
          :number_of_energy_power_combined_cycle_coal,
          :number_of_energy_power_combined_cycle_network_gas,
          :number_of_energy_power_hydro_river,
          :number_of_energy_power_nuclear_gen2_uranium_oxide,
          :number_of_energy_power_supercritical_coal,
          :number_of_energy_power_supercritical_waste_mix,
          :number_of_energy_power_ultra_supercritical_coal,
          :number_of_energy_power_ultra_supercritical_cofiring_coal,
          :number_of_energy_power_ultra_supercritical_network_gas,
          :number_of_energy_power_wind_turbine_coastal,
          :number_of_energy_power_wind_turbine_inland,
          :number_of_energy_power_wind_turbine_offshore
        ].each do |name|
          model.attribute name, Float, group: :supply
        end
      end
    end
  end
end
