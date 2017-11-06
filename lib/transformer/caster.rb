module Transformer
  module Caster
    # Overall cast method. Casts a set of attributes to initializer
    # inputs and a set of values needed to create a dataset.
    #
    # Arguments:
    # - dataset       = Atlas::Dataset
    # - dataset_cast = Hash[<key> => Float]
    #
    def self.cast(dataset, dataset_cast_attributes)
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
      dataset_cast_attributes.each_with_object({}) do |(key, val), obj|
        if GraphMethods.all.keys.include?(key.to_sym)
          obj[:graph_methods] ||= {}
          obj[:graph_methods][key] = val
        else
          obj[key] = val
        end
      end
    end

    def self.casts
      [
        Caster::Exporter,
        Caster::AreaAttributes,
        Caster::Industry,
        Caster::Agriculture
      ].freeze
    end
  end
end
