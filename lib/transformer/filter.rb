module Transformer
  Filter = -> (attributes) do
    attributes.reject! { |_, val| val.blank? }

    attributes
      .symbolize_keys!
      .slice!(*GraphMethods.all.keys)
      .merge(graph_methods: attributes)
  end
end
