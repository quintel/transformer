module Transformer
  module Caster
    class Exporter < Base
      def analyze
        @dataset_cast.graph_methods.each_pair do |key, value|
          next unless value

          @template.add_graph_value(GraphMethods.all[key], value)
        end

        @template
      end
    end
  end
end
