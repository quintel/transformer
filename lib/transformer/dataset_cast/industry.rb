module Transformer
  class DatasetCast
    module Industry
      def self.included(model)
        model.attribute :has_industry, Boolean, group: :industry_toggle

        model.attribute :industry_aluminium_production, Float,
          group: :industry_grouped, unit: '%'

        model.attribute :industry_chemicals_fertilizers_burner_coal_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_fertilizers_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_fertilizers_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_fertilizers_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_other_burner_coal_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_other_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_other_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_other_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_refineries_burner_coal_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_refineries_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_refineries_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_chemicals_refineries_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_final_demand_for_chemical_fertilizers_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_final_demand_for_chemical_other_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_final_demand_for_chemical_refineries_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_final_demand_for_other_food_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_final_demand_for_other_paper_steam_hot_water_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_food_burner_coal_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_food_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_food_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_food_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_food_heater_electricity_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_metals_production, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_paper_burner_coal_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_paper_burner_crude_oil_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_paper_burner_network_gas_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_paper_burner_wood_pellets_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_other_paper_heater_electricity_share, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_steel_production, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_fertilizers, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_other_coal_non_energetic, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_other_crude_oil_non_energetic, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_other_electricity, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_other_network_gas_non_energetic, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_other_useable_heat, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_other_wood_pellets_non_energetic, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_chemical_refineries, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_coal, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_coal_non_energetic, Float,
          group: :industry_grouped, unit: '%'

        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_crude_oil, Float,
          group: :industry_grouped, unit: '%'

        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_crude_oil_non_energetic, Float,
          group: :industry_grouped, unit: '%'

        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_electricity, Float,
          group: :industry_grouped, unit: '%'

        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_network_gas, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_network_gas_non_energetic, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_useable_heat, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_wood_pellets, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_aggregated_industry_nl_wood_pellets_non_energetic, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_construction, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_food, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_ict, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_machinery, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_minerals, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_mining, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_non_specified, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_paper, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_textile, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_transport_equipment, Float, group: :industry_grouped, unit: '%'
        model.attribute :industry_useful_demand_for_other_wood_products, Float, group: :industry_grouped, unit: '%'

        model.attribute :number_of_industry_chp_combined_cycle_gas_power_fuelmix, Float, group: :industry_grouped
        model.attribute :number_of_industry_chp_engine_gas_power_fuelmix, Float, group: :industry_grouped
        model.attribute :number_of_industry_chp_turbine_gas_power_fuelmix, Float, group: :industry_grouped
      end
    end
  end
end
