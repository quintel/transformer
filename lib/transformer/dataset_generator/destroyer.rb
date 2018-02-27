module Transformer
  class DatasetGenerator
    Destroyer = lambda do |cast|
      FileUtils.rm_rf(
        Atlas::Dataset::Derived.find(cast.area).dataset_dir
      )
    end
  end
end
