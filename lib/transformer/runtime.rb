module Transformer
  class Runtime < Atlas::Runtime
    def initialize(dataset, cast)
      @dataset = dataset
      @cast    = cast
      @graph   = ::Atlas::GraphBuilder.build
    end

    private

    def DATASET_INPUT(key)
      @cast.inputs.to_h.fetch(key)
    end

    def AREA(key)
      @cast.attributes[key] || super
    end

    def SPARSE_GRAPH_QUERY(part, method)
      execute(::Atlas::SparseGraphQuery.find(:"#{part}+#{method}").query)
    end

    def NODE_VALUE(node_key, attribute)
      ::Atlas::EnergyNode.find(node_key).public_send(attribute)
    end

    def NODE_EFFICIENCY(node_key, direction, carrier)
      node = ::Atlas::EnergyNode.find(node_key)
      query = node.queries[:"#{direction}.#{carrier}"]

      if query
        execute(query)
      else
        node.public_send(direction).fetch(carrier)
      end
    end

    def EDGE_VALUE(edge_key, attribute)
      ::Atlas::EnergyEdge.find(edge_key).public_send(attribute)
    end

    def IF(condition, true_statement, false_statement)
      statement = condition ? true_statement : false_statement
      statement.respond_to?(:call) ? statement.call : statement
    end

    def MAX(value, other_value)
      value > other_value ? value : other_value
    end
  end
end
