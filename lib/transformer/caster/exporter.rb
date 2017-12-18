module Transformer
  module Caster
    class Exporter < Base
      def analyze
        each_exportable_attribute do |graph_method, value|
          @template.add_graph_value(graph_method, value)
        end

        @template
      end

      private

      def each_exportable_attribute
        @dataset_cast.graph_methods.each_pair do |key, value|
          opts = GraphMethods.all[key]

          if value && (opts = GraphMethods.all[key])
            yield(opts, value)
          end
        end
      end
    end
  end
end
