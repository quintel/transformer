module Transformer
  class DatasetCast
    module Households
      def self.included(model)
        model.attribute :households_electricity_consumption, Float,
          unit: 'kWh', group: :households, mandatory: true

        model.attribute :households_gas_consumption, Float,
          unit: 'm3',  group: :households, mandatory: true

        # Electricity shares
        model.attribute :households_final_demand_for_cooling_electricity, Float,
          unit: '%', group: :households_final_demand_electricity, node: :self

        model.attribute :households_final_demand_for_hot_water_electricity, Float,
          unit: '%', group: :households_final_demand_electricity, node: :self

        model.attribute :households_final_demand_for_cooking_electricity, Float,
          unit: '%', group: :households_final_demand_electricity, node: :self

        model.attribute :households_final_demand_for_space_heating_electricity, Float,
          unit: '%', group: :households_final_demand_electricity, node: :self

        model.attribute :households_final_demand_for_appliances_electricity, Float,
          unit: '%', group: :households_final_demand_electricity, node: :self

        model.attribute :households_final_demand_for_lighting_electricity, Float,
          unit: '%', group: :households_final_demand_electricity, node: :self

        # Cooking shares
        model.attribute :households_cooker_halogen_electricity, Float,
          unit: '%', group: :households_final_demand_for_cooking_electricity,
          node: :self

        model.attribute :households_cooker_resistive_electricity, Float,
          unit: '%', group: :households_final_demand_for_cooking_electricity,
          node: :self

        model.attribute :households_cooker_induction_electricity, Float,
          unit: '%', group: :households_final_demand_for_cooking_electricity,
          node: :self

        # Cooling
        model.attribute :households_cooling_airconditioning_electricity, Float,
          unit: '%', group: :households_final_demand_for_cooling_electricity,
          node: :self

        model.attribute :households_cooling_heatpump_air_water_electricity, Float,
          unit: '%', group: :households_final_demand_for_cooling_electricity,
          node: :self

        model.attribute :households_cooling_heatpump_ground_water_electricity, Float,
          unit: '%', group: :households_final_demand_for_cooling_electricity,
          node: :self

        # Lighting
        model.attribute :households_lighting_led_electricity, Float,
          unit: '%', group: :households_final_demand_for_lighting_electricity,
          node: :self

        model.attribute :households_lighting_incandescent_electricity, Float,
          unit: '%', group: :households_final_demand_for_lighting_electricity,
          node: :self

        model.attribute :households_lighting_efficient_fluorescent_electricity, Float,
          unit: '%', group: :households_final_demand_for_lighting_electricity,
          node: :self

        # Network gas
        model.attribute :households_final_demand_for_hot_water_network_gas, Float,
          unit: '%', group: :households_final_demand_network_gas,
          node: :self

        model.attribute :households_final_demand_for_cooking_network_gas, Float,
          unit: '%', group: :households_final_demand_network_gas,
          node: :self

        model.attribute :households_final_demand_for_space_heating_network_gas, Float,
          unit: '%', group: :households_final_demand_network_gas,
          node: :self

        model.attribute :households_final_demand_for_cooling_network_gas, Float,
          unit: '%', group: :households_final_demand_network_gas,
          node: :self
      end
    end
  end
end
