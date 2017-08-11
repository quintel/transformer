module Transformer
  module Caster
    class NullAttributes < Base
      def analyze
        assumptions.fetch(:null_attributes)
      end
    end
  end
end
