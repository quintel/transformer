module Transformer
  module Caster
    module_function

    # Overall cast method. Casts a set of attributes to initializer
    # inputs and a set of values needed to create a dataset.
    #
    # Arguments:
    # - dataset_cast = Hash[<key> => Float]
    #
    def cast(dataset_cast)
      unless dataset_cast.valid?
        raise ArgumentError, dataset_cast.errors.full_messages.join(', ')
      end

      casts.reduce(Template.new) do |object, analyzer|
        analyzer.analyze(dataset_cast, object)
      end.dump
    end

    def casts
      [
        Caster::Exporter,
        Caster::AreaAttributes,
        Caster::FileValues
      ].freeze
    end
  end
end
