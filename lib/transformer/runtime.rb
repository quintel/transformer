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

    def SPARSE_GRAPH_QUERY(part, method)
      execute(::Atlas::SparseGraphQuery.find(:"#{part}+#{method}").query)
    end

    def NODE_VALUE(node_key, attribute)
      Atlas::Node.find(node_key).public_send(attribute)
    end

    def NODE_EFFICIENCY(node_key, direction, carrier)
      Atlas::Node.find(node_key).public_send(direction).fetch(carrier)
    end

    def EDGE_VALUE(edge_key, attribute)
      Atlas::Edge.find(edge_key).public_send(attribute)
    end
  end
end
