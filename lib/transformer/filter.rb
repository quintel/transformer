module Transformer
  Filter = lambda do |attributes|
    attributes.reject! { |_, val| val.blank? }

    inputs = attributes
             .symbolize_keys!
             .slice!(*Atlas::Dataset::Derived.attribute_set.map(&:name))

    attributes.merge(inputs: inputs)
  end
end
