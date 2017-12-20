module Transformer
  module Caster
    class AreaAttributes < Base
      def analyze
        @template.add_area(:number_of_old_residences, number_of_old_residences)
        @template.add_area(:number_of_new_residences, number_of_new_residences)
        @template
      end

      private

      def number_of_old_residences
        @number_of_old_residences ||=
          (@dataset_cast.number_of_residences * (@dataset_cast.percentage_of_old_residences.to_f / 100))
      end

      def number_of_new_residences
        @number_of_new_residences ||=
          (@dataset_cast.number_of_residences - number_of_old_residences)
      end
    end
  end
end
