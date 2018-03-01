module Transformer
  module Caster
    class AreaAttributes < Base
      def analyze
        set_cast_attributes!

        @template.add_area(:number_of_old_residences, number_of_old_residences)
        @template.add_area(:number_of_new_residences, number_of_new_residences)
        @template
      end

      private

      def set_cast_attributes!
        @dataset_cast.attributes
          .slice(*Atlas::Dataset.attribute_set.map(&:name))
          .each_pair do |key, val|
            @template.add_area(key, val)
          end
      end

      def number_of_old_residences
        @number_of_old_residences ||=
          (@dataset_cast.number_of_residences * (@dataset_cast.graph_methods.percentage_of_old_residences.to_f / 100))
      end

      def number_of_new_residences
        @number_of_new_residences ||=
          (@dataset_cast.number_of_residences - number_of_old_residences)
      end
    end
  end
end
