module Transformer
  module Caster
    module Assumptions
      def conversion(key)
        assumptions.fetch(:conversions).fetch(key)
      end

      def demand(key)
        assumptions.fetch(:demands).fetch(key)
      end

      def efficiency_for(key)
        value = assumptions.fetch(:efficiencies).fetch(key)

        value.is_a?(Numeric) ? value : efficiency_from_node(key, value)
      end

      def conversion(key)
        assumptions.fetch(:conversions).fetch(key)
      end

      def assumptions
        @assumptions ||= YAML.load_file(Transformer.assumptions_path).freeze
      end

      private

      def efficiency_from_node(key, value)
        node = Atlas::Node.find(key)

        if value.is_a?(Symbol)
          node.output.fetch(value)
        elsif value.is_a?(Hash)
          (1 / node.input.fetch(value.fetch(:input)))
        end
      end
    end
  end
end
