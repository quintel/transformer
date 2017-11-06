module Transformer
  module Caster
    class SectorSwitcher < Base
      def analyze
        nodes.each do |node|
          value = @dataset_cast.graph_methods.public_send("#{ node.key }_demand")

          @template.add_graph_value(node.key, 'demand', (value && has_sector? ? value : 0))
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

      def nodes
        Atlas::Node.all.select do |node|
          node.sector == sector &&
            node.graph_methods.include?('demand')
        end
      end
    end
  end
end
