module Transformer
  module Caster
    class Exporter < Base
      def analyze
        GraphMethods.all.each do |key, attribute|
          value = @dataset_cast.graph_methods[key]
          query = Atlas::Gquery.all.detect { |gq| gq.key == key }

          next unless value || query

          @template.add_graph_value(attribute, (
            if value
              value
            elsif query
              runtime.execute(query.query)
            end
          ))
        end

        @template
      end
    end
  end
end
