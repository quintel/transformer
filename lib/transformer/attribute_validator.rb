module Transformer
  class AttributeValidator
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
      DatasetCast::EDITABLE_ATTRIBUTES.select do |key, opts|
        opts['mandatory'] && @edits[key].blank?
      end
    end
  end
end
