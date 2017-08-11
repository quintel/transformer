module Transformer
  module Caster
    class Supply < Base
      def analyze
        @dataset_edits.slice(*supply_attributes)
      end

      private

      # Please remove for this is quiet hacky
      def supply_attributes
        DatasetCast.attribute_set.select { |attribute|
          attribute.options[:group] == :supply
        }.map(&:name).map(&:to_s)
      end
    end
  end
end
