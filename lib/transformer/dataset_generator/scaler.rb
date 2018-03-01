module Transformer
  class DatasetGenerator
    module Scaler
      module_function

      def call(cast)
        Atlas::Scaler.new(
          cast.base_dataset,
          cast.area,
          cast.number_of_residences
        ).create_scaled_dataset

        cast
      end
    end
  end
end
