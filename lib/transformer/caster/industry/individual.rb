module Transformer
  module Caster
    class Industry
      class Individual < Base
        def analyze
          return {} unless has_industry

          @dataset_edits.slice(*valid_input_keys)
        end

        private

        def valid_input_keys
          Atlas::InitializerInput.all.map(&:key).select do |key|
            key =~ /industry/
          end
        end
      end
    end
  end
end
