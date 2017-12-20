module Transformer
  module Caster
    class ToAtlasAttribute
      def self.filter(dataset_cast, template)
        new(dataset_cast, template).filter
      end

      def filter
        { area: area_attributes,
          graph_values: @template.get(:graph_values) }
      end

      private

      def initialize(dataset_cast, template)
        @dataset_cast = dataset_cast
        @template     = template
      end

      def area_attributes
        @template.get(:area).each_pair do |area_key, value|
          @dataset_cast.public_send("#{ area_key }=", value)
        end

        @dataset_cast.attributes
          .slice(*Atlas::Dataset.attribute_set.map(&:name))
      end
    end
  end
end
