module Transformer
  class DatasetGenerator
    Validator = lambda do |cast|
      Atlas::Runner.new(
        Atlas::Dataset::Derived.find(cast.area)
      ).calculate

      cast
    end
  end
end
