module Transformer
  class Runtime < Atlas::Runtime
    def initialize(dataset, cast)
      @dataset = dataset
      @cast    = cast
      @graph   = ::Atlas::GraphBuilder.build
    end

    private

    def DATASET_INPUT(key)
      @cast.inputs[key] || 0
    end

    def SPARSE_GRAPH_QUERY(part, method)
      execute(::Atlas::SparseGraphQuery.find(:"#{part}+#{method}").query)
    end
  end
end
