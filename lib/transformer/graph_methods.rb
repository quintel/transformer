module Transformer
  module GraphMethods
    GraphAttribute = Struct.new(
      :type, :export_key, :export_method, :sparse_graph_query
    )

    module_function

    def all
      @all ||= node_attributes.merge(edge_attributes)
    end

    def node_attributes
      Atlas::EnergyNode.all.each_with_object({}) do |node, result|
        node.graph_methods.each do |method|
          result[:"#{ node.key }_#{ method }"] = create_attribute(node, method)
        end
      end
    end

    def edge_attributes
      Atlas::EnergyEdge.all.each_with_object({}) do |edge, result|
        edge.graph_methods.each do |method|
          result[:"#{ edge.supplier }_#{ edge.consumer }_#{ method }"] =
            create_attribute(edge, method)
        end
      end
    end

    def create_attribute(obj, method)
      GraphAttribute.new(Float,
                         obj.key,
                         method,
                         find_query(obj.key, method))
    end

    def find_query(key, method)
      begin
        Atlas::SparseGraphQuery.find(:"#{key}+#{method}")
      rescue Atlas::DocumentNotFoundError
        nil
      end
    end
  end
end
