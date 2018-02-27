module Transformer
  class DatasetGenerator
    module Validator
      module_function

      def call(cast)
        Atlas::Runner.new(
          Atlas::Dataset::Derived.find(cast.area)
        ).calculate

        cast
      end
    end
  end
end
