module Transformer
  class DatasetGenerator
    Destroyer = lambda do |cast|
      Atlas::Dataset::Derived.find(cast.area).destroy! if Atlas::Dataset::Derived.exists?(cast.area)
    end
  end
end
