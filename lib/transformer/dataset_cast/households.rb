module Transformer
  class DatasetCast
    module Households
      def self.included(model)
        model.attribute :electricity_consumption, Float,
          unit: 'kWh', group: :households, mandatory: true

        model.attribute :gas_consumption, Float,
          unit: 'm3',  group: :households, mandatory: true
      end
    end
  end
end
