module Transformer
  module Caster
    class Industry < Base
      def analyze
        [Individual, Nulled].each_with_object({}) do |analyzer, object|
          object.merge! analyzer.analyze(@dataset, graph, @dataset_edits, @analyzed_attributes)
        end
      end
    end
  end
end
