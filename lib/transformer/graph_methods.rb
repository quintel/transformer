module Transformer
  module GraphMethods
    GraphAttribute = Struct.new(:type, :export_key, :export_method)

    module_function

    def all
      @all ||= node_attributes.merge(edge_attributes)
    end

    def node_attributes
      Atlas::Node.all.each_with_object({}) do |node, result|
        node.graph_methods.each do |method|
          result[:"#{ node.key }_#{ method }"] =
            GraphAttribute.new(Float, node.key, method)
        end
      end
    end

    def edge_attributes
      Atlas::Edge.all.each_with_object({}) do |edge, result|
        edge.graph_methods.each do |method|
          result[:"#{ edge.supplier }_#{ edge.consumer }_#{ method }"] =
            GraphAttribute.new(Float, edge.key, method)
        end
      end
    end
  end
end
