# frozen_string_literal: true

module Transformer
  module Caster
    # Extracts values from the dataset params and stores them in the template for later
    # transformation into a file.
    class FileValues < Base
      def analyze
        # For each keyed file value, add it to the template hash.
        FileKeys.all.each do |key, cell|
          if (value = @dataset_cast.inputs[key])
            @template.add_file_value(cell, value)
          end
        end

        @template
      end
    end
  end
end
