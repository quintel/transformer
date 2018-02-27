module Transformer
  class DatasetGenerator
    module Analyzer
      module_function

      def call(cast)
        values = Caster.cast(cast)

        dataset = Atlas::Dataset::Derived.find(cast.area)

        dataset.attributes = values.fetch(:area)
        dataset.save

        dataset.graph_values.values = values.fetch(:graph_values)
        dataset.graph_values.save

        cast
      end
    end
  end
end
