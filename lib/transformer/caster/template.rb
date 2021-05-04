module Transformer
  module Caster
    class Template
      def initialize
        @template = { area: {}, file_values: {}, graph_values: {} }
      end

      def add_graph_value(graph_method, value)
        key = graph_method.export_key.to_s
        export_method = graph_method.export_method

        @template.fetch(:graph_values)[key] ||= {}
        @template.fetch(:graph_values).fetch(key).store(export_method, value)
      end

      def add_file_value(cell, value)
        @template[:file_values][cell.file] ||= {}
        @template[:file_values][cell.file][cell] = value unless value.nil?
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
