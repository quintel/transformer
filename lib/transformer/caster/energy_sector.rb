module Transformer
  module Caster
    class EnergySector < Base
      def analyze
        assumptions.fetch(:number_of).transform_values do |value|
          value * number_of_residences
        end
      end
    end
  end
end
