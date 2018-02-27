module Transformer
  class DatasetGenerator
    module Destroyer
      module_function

      def call(cast)
        FileUtils.rm_rf(
          Atlas::Dataset::Derived.find(cast.area).dataset_dir
        )
      end
    end
  end
end
