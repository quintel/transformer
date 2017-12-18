module Transformer
  module Caster
    class SectorSwitcher < Base
      def analyze
        graph_methods.each_pair do |key, graph_method|
          value = @dataset_cast.graph_methods.public_send(key)

          @template.add_graph_value(graph_method, (value && has_sector? ? value : 0))
        end

        @template
      end

      private

      def has_sector?
        @dataset_cast.public_send("has_#{ sector }")
      end

      def sector
        raise NotImplementedError,
          "every subclass of SectorSwitcher needs a sector"
      end

      def graph_methods
        GraphMethods.all.select do |key, graph_method|
          graph_method.sector == sector &&
            graph_method.export_method == 'demand'
        end
      end
    end
  end
end
