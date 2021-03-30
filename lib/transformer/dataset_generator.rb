module Transformer
  class DatasetGenerator
    def initialize(params)
      @cast = DatasetCast.new(Filter.call(params))

      return if @cast.valid?

      raise ArgumentError, @cast.errors.full_messages.join(', ')
    end

    def generate(extras = [])
      (generators + extras).reduce(@cast) do |cast, generator|
        generator.call(cast)
      end
    end

    def destroy
      Destroyer.call(@cast)
    end

    private

    def generators
      [Scaler, Analyzer].freeze
    end
  end
end
