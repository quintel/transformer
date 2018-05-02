module Transformer
  module Caster
    class Base
      def self.analyze(dataset_cast, template)
        new(dataset_cast, template).analyze
      end

      # Initializing an analyzer
      #
      # Arguments:
      # - dataset_cast  = Transformer::DatasetCast
      # - template      = Transformer::Caster::Template
      #
      def initialize(dataset_cast, template)
        unless dataset_cast.is_a?(DatasetCast)
          raise ArgumentError, 'dataset cast argument is not a DatasetCast'
        end

        unless template.is_a?(Template)
          raise ArgumentError, 'template must be a Caster::Template'
        end

        @dataset_cast = dataset_cast
        @template     = template
      end

      def runtime
        @runtime ||= Runtime.new(
          Atlas::Dataset::Derived.find(@dataset_cast.area).parent,
          @dataset_cast
        )
      end

      def analyze
        raise NotImplentedError,
              "base class '#{self.class}' misses analyze method"
      end
    end
  end
end
