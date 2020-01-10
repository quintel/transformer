module Transformer
  class DatasetGenerator
    Scaler = lambda do |cast|
      unless Atlas::Dataset::Derived.exists?(cast.area)
        Atlas::Scaler.new(
          cast.base_dataset,
          cast.area,
          cast.number_of_residences,
          time_curves_to_zero: cast.time_curves_to_zero
        ).create_scaled_dataset
      end

      cast
    end
  end
end
