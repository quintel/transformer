module Transformer
  module Caster
    class AreaAttributes < Base
      def analyze
        Atlas::Dataset.attribute_set
          .map(&:name)
          .each(&method(:add_one_to_one))
          .each(&method(:add_by_query))

        @template
      end

      private

      def add_one_to_one(key)
        value = @dataset_cast.attributes[key]

        @template.add_area(key, value) if value
      end

      def add_by_query(key)
        begin
          query = Atlas::SparseGraphQuery.find(:"#{key}+area")

          @template.add_area(key, runtime.execute(query.query))
        rescue Atlas::DocumentNotFoundError
        end
      end
    end
  end
end
