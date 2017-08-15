module Transformer
  class DatasetCast
    module Agriculture
      def self.included(model)
        model.attribute :has_agriculture, Boolean, group: :agriculture_toggle

        model.attribute :agriculture_burner_crude_oil_share, Float,
          group: :agriculture_grouped, unit: '%'
        model.attribute :agriculture_burner_network_gas_share, Float,
          group: :agriculture_grouped, unit: '%'
        model.attribute :agriculture_burner_wood_pellets_share, Float,
          group: :agriculture_grouped, unit: '%'
        model.attribute :agriculture_final_demand_steam_hot_water_share, Float,
          group: :agriculture_grouped, unit: '%'
        model.attribute :agriculture_geothermal_share, Float,
          group: :agriculture_grouped, unit: '%'
        model.attribute :agriculture_heatpump_water_water_ts_electricity_share, Float,
          group: :agriculture_grouped, unit: '%'

        model.attribute :agriculture_useful_demand_electricity, Float,
          group: :agriculture_grouped
        model.attribute :agriculture_useful_demand_useable_heat, Float,
          group: :agriculture_grouped
        model.attribute :number_of_agriculture_chp_engine_biogas, Float,
          group: :agriculture_grouped
        model.attribute :number_of_agriculture_chp_engine_network_gas, Float,
          group: :agriculture_grouped
        model.attribute :number_of_agriculture_chp_supercritical_wood_pellets, Float,
          group: :agriculture_grouped
      end
    end
  end
end
