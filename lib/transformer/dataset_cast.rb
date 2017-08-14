module Transformer
  class DatasetCast
    include Virtus.model

    attribute :has_agriculture, Boolean, group: :agriculture_toggle
    attribute :has_industry,    Boolean, group: :industry_toggle

    attribute :electricity_consumption,            Float, mandatory: true, unit: 'kWh'
    attribute :gas_consumption,                    Float, mandatory: true, unit: 'm3'
    attribute :number_of_inhabitants,              Integer, mandatory: true, unit: ''
    attribute :number_of_cars,                     Integer, group: :transport, mandatory: true, unit: ''
    attribute :number_of_residences,               Float, mandatory: true, unit: ''
    attribute :number_of_residences_with_solar_pv, Integer, mandatory: true, unit: ''
    attribute :percentage_of_old_residences,       Float, mandatory: true, unit: '%'
    attribute :roof_surface_available_for_pv,      Float, mandatory: true, unit: 'm2'
    attribute :building_area,                      Float, group: :buildings, mandatory: true, unit: 'm2'

    attribute :households_final_demand_electricity, Float, group: :slider, unit: '%'
    attribute :households_final_demand_for_cooking_electricity, Float, group: :slider, unit: '%'
    attribute :households_final_demand_for_cooling_electricity, Float, group: :slider, unit: '%'
    attribute :households_final_demand_for_lighting_electricity, Float, group: :slider, unit: '%'
    attribute :households_final_demand_network_gas, Float, group: :slider, unit: '%'

    attribute :industry_aluminium_production, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_fertilizers_burner_coal_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_fertilizers_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_fertilizers_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_fertilizers_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_other_burner_coal_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_other_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_other_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_other_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_refineries_burner_coal_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_refineries_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_refineries_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_chemicals_refineries_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_final_demand_for_chemical_fertilizers_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_final_demand_for_chemical_other_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_final_demand_for_chemical_refineries_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_final_demand_for_other_food_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_final_demand_for_other_paper_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_food_burner_coal_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_food_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_food_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_food_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_food_heater_electricity_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_metals_production, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_paper_burner_coal_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_paper_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_paper_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_paper_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_other_paper_heater_electricity_share, Float, group: :industry_grouped, unit: '%'
    attribute :industry_steel_production, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_fertilizers, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_other_coal_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_other_crude_oil_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_other_electricity, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_other_network_gas_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_other_useable_heat, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_other_wood_pellets_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_chemical_refineries, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_coal, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_coal_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_crude_oil, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_crude_oil_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_electricity, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_network_gas, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_network_gas_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_useable_heat, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_wood_pellets, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_aggregated_industry_nl_wood_pellets_non_energetic, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_construction, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_food, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_ict, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_machinery, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_minerals, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_mining, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_non_specified, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_paper, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_textile, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_transport_equipment, Float, group: :industry_grouped, unit: '%'
    attribute :industry_useful_demand_for_other_wood_products, Float, group: :industry_grouped, unit: '%'

    attribute :number_of_industry_chp_combined_cycle_gas_power_fuelmix, Float, group: :industry_grouped
    attribute :number_of_industry_chp_engine_gas_power_fuelmix, Float, group: :industry_grouped
    attribute :number_of_industry_chp_turbine_gas_power_fuelmix, Float, group: :industry_grouped

    attribute :agriculture_burner_crude_oil_share, Float, group: :agriculture_grouped, unit: '%'
    attribute :agriculture_burner_network_gas_share, Float, group: :agriculture_grouped, unit: '%'
    attribute :agriculture_burner_wood_pellets_share, Float, group: :agriculture_grouped, unit: '%'
    attribute :agriculture_final_demand_steam_hot_water_share, Float, group: :agriculture_grouped, unit: '%'
    attribute :agriculture_geothermal_share, Float, group: :agriculture_grouped, unit: '%'
    attribute :agriculture_heatpump_water_water_ts_electricity_share, Float, group: :agriculture_grouped, unit: '%'
    attribute :agriculture_useful_demand_electricity, Float, group: :agriculture_grouped
    attribute :agriculture_useful_demand_useable_heat, Float, group: :agriculture_grouped
    attribute :number_of_agriculture_chp_engine_biogas, Float, group: :agriculture_grouped
    attribute :number_of_agriculture_chp_engine_network_gas, Float, group: :agriculture_grouped
    attribute :number_of_agriculture_chp_supercritical_wood_pellets, Float, group: :agriculture_grouped

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
      attribute name, Float, group: :supply
    end
  end
end
