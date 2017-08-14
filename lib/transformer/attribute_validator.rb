module Transformer
  class AttributeValidator
    EDITABLE_ATTRIBUTES = YAML.load_file(Pathname.new(Transformer.root).join('attributes.yml')).freeze

    def initialize(edits)
      @edits = edits
    end

    def valid?
      !missing.any?
    end

    def message
      "missing attributes #{ missing.keys.join(', ') } for analyzes"
    end

    private

    def missing
      EDITABLE_ATTRIBUTES.select do |key, opts|
        opts['mandatory'] && @edits[key].blank?
      end
    end
  end
end
