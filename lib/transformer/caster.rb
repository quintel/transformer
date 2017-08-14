module Transformer
  module Caster
    # Overall cast method. Casts a set of attributes to initializer
    # inputs and a set of values needed to create a dataset.
    #
    # Arguments:
    # - dataset       = Atlas::Dataset
    # - dataset_edits = Hash[<key> => Float]
    #
    def self.cast(dataset, dataset_edits)
      validator = AttributeValidator.new(dataset_edits)

      unless validator.valid?
        raise ArgumentError, validator.message
      end

      casts = [
        Caster::ElectricityConsumption,
        Caster::Lighting,
        Caster::Appliances,
        Caster::GasConsumption,
        Caster::Cooking,
        Caster::Cooling,
        Caster::WaterHeater,
        Caster::SpaceHeater,
        Caster::RoofSurfaceAvailableForPV,
        Caster::Transport,
        Caster::Buildings,
        Caster::Industry,
        Caster::Agriculture,
        Caster::EnergySector,
        Caster::NullAttributes,
        Caster::ToAtlasAttribute
      ].freeze

      graph = Atlas::Runner.new(dataset).calculate

      casts.reduce({}) do |object, analyzer|
        (casts.last == analyzer ? {} : object).merge(analyzer.analyze(dataset, graph, dataset_edits.symbolize_keys, object))
      end
    end
  end
end
