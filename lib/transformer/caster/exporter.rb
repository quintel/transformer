module Transformer
  module Caster
    class Exporter < Base
      def analyze
        GraphMethods.all.each do |key, attribute|
          set_one_to_one_inputs!(key, attribute)
          set_graph_queries!(key, attribute)
        end

        @template
      end

      private

      # Private: set_one_to_one_input!
      #
      # Sets values to the template from the inputs which keys are a direct
      # match with a method in the sparse graph.
      def set_one_to_one_inputs!(key, attribute)
        val = @dataset_cast.inputs[key]

        if val
          @template.add_graph_value(attribute, val)
        end
      end

      # Private: set_graph_queries!
      #
      # Executes all graph methods by query.
      def set_graph_queries!(_, attribute)
        query = attribute.sparse_graph_query

        if query
          @template.add_graph_value(attribute, runtime.execute(query.query))
        end
      end
    end
  end
end
