module Transformer
  class DatasetCast
    module Transport
      def self.included(model)
        model.attribute :number_of_cars, Integer,
          group: :transport, mandatory: true, unit: ''
      end
    end
  end
end
