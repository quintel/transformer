# frozen_string_literal: true

module Transformer
  class FileValues
    def analyze
      # For each keyed file value, add it to the template hash.
      FileKeys.each do |cell|
        if (value = @dataset_cast.inputs[key])
          @template.add_file_value(cell, value)
        end
      end

      @template
    end
  end
end
