module Transformer
  module Caster
    class Exporter < Base
      def analyze
        set_one_to_one_inputs!
        set_graph_queries!

        @template
      end

      private

      # Private: set_one_to_one_input!
      #
      # Sets values to the template from the inputs which keys are a direct
      # match with a method in the sparse graph.
      def set_one_to_one_inputs!
        @dataset_cast.inputs.each_pair do |key, val|
          next unless GraphMethods.all.key?(key)

          @template.add_graph_value(GraphMethods.all.fetch(key), val)
        end
      end

      # Private: set_graph_queries!
      #
      # Executes all graph methods by query.
      def set_graph_queries!
        GraphMethods.all.each do |_, attribute|
          query = attribute.sparse_graph_query

          if query
            @template.add_graph_value(attribute, runtime.execute(query.query))
          end
        end
      end
    end
  end
end
