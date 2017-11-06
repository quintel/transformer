module Transformer
  module Caster
    class Template
      def initialize
        @template = { area: {}, graph_values: {} }
      end

      def add_graph_value(key, method, value)
        methods = @template.fetch(:graph_values)

        @template.fetch(:graph_values)[key] ||= {}
        @template.fetch(:graph_values).fetch(key).store(method, value)
      end

      def add_area(key, value)
        @template.fetch(:area).store(key, value)
      end

      def get(key)
        @template.fetch(key)
      end

      def to_h
        @template
      end
    end
  end
end
