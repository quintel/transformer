module Transformer
  class Runtime < Atlas::Runtime
    def initialize(dataset, cast)
      @dataset = dataset
      @cast    = cast
      @graph   = Atlas::GraphBuilder.build
    end

    private

    def ETLOCAL(key)
      @cast.graph_methods[key] || 0
    end
  end
end
