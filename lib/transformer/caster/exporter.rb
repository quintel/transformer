module Transformer
  module Caster
    class Exporter < Base
      GraphMethodValue = Struct.new(:method, :key, :value)

      def analyze
        exportable_attributes.map do |key, opts|
          @template.add_graph_value(opts.key, opts.method, opts.value)
        end

        @template
      end

      private

      def exportable_attributes
        result = {}

        @dataset_cast.graph_methods.each_pair do |key, value|
          opts = GraphMethods.all[key]

          if opts && value
            result[key] = GraphMethodValue.new(opts.export_method,
                                               opts.export_key,
                                               value)
          end
        end

        result
      end
    end
  end
end
