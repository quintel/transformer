module Transformer
  module Caster
    # Overall cast method. Casts a set of attributes to initializer
    # inputs and a set of values needed to create a dataset.
    #
    # Arguments:
    # - dataset_cast = Hash[<key> => Float]
    #
    def self.cast(dataset_cast_attributes)
      dataset_cast = DatasetCast.new(filter(dataset_cast_attributes))

      unless dataset_cast.valid?
        raise ArgumentError, dataset_cast.errors.full_messages.join(', ')
      end

      Caster::ToAtlasAttribute
        .filter(dataset_cast, casts.reduce(Template.new) do |object, analyzer|
          analyzer.analyze(dataset_cast, object)
        end)
    end

    private

    def self.filter(dataset_cast_attributes)
      attrs = dataset_cast_attributes
        .symbolize_keys
        .reject { |_, val| val.blank? }

      attrs.merge(graph_methods: attrs.slice(*GraphMethods.all.keys))
    end

    def self.casts
      [
        Caster::Exporter,
        Caster::AreaAttributes
      ].freeze
    end
  end
end
