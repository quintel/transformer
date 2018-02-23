module Transformer
  module Caster
    class Template
      def initialize
        @template = { area: {}, graph_values: {} }
      end

      def add_graph_value(graph_method, value)
        methods = @template.fetch(:graph_values)

        @template.fetch(:graph_values)[graph_method.export_key] ||= {}
        @template.fetch(:graph_values)
          .fetch(graph_method.export_key)
          .store(graph_method.export_method, value)
      end

      def add_area(key, value)
        @template.fetch(:area).store(key, value)
      end

      def get(key)
        @template.fetch(key)
      end

      def dump
        @template
      end
    end
  end
end
