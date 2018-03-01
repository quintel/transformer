module Transformer
  Filter = -> (attributes) do
    attributes.reject! { |_, val| val.blank? }

    graph_methods = attributes
      .symbolize_keys!
      .slice!(*Atlas::Dataset::Derived.attribute_set.map(&:name))

    attributes.merge(graph_methods: graph_methods)
  end
end
