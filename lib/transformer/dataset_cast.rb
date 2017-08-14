module Transformer
  class DatasetCast
    include Virtus.model

    EDITABLE_ATTRIBUTES = YAML.load_file(Pathname.new(Transformer.root).join('attributes.yml')).freeze
  end
end
