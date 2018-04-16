module Transformer
  class DatasetGenerator
    Scaler = lambda do |cast|
      Atlas::Scaler.new(
        cast.base_dataset,
        cast.area,
        cast.number_of_residences
      ).create_scaled_dataset

      cast
    end
  end
end
