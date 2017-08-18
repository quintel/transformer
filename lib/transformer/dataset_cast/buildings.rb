module Transformer
  class DatasetCast
    module Buildings
      def self.included(model)
        model.attribute :building_area, Float,
          group: :buildings, mandatory: true, unit: 'm2'
      end
    end
  end
end
