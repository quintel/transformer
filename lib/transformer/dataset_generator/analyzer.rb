module Transformer
  class DatasetGenerator
    Analyzer = lambda do |cast|
      values = Caster.cast(cast)

      dataset = Atlas::Dataset::Derived.find(cast.area)

      dataset.update_attributes(values.fetch(:area))

      dataset.graph_values.values = values.fetch(:graph_values)
      dataset.graph_values.save

      cast
    end
  end
end
