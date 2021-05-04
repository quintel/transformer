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

    # Public: Given an array of paths which are relative to the dataset being created or updated,
    # ensures that these paths are not deleted, but are restored after the block is executed.
    #
    # For example:
    #
    #   generator.preserve_paths(%w[curves something/else]) do
    #     generator.destroy
    #     generator.generate
    #   end
    #
    # Returns the value of the block.
    def preserve_paths(paths, &block)
      return yield unless Atlas::Dataset::Derived.exists?(@cast.area)

      dir = Atlas::Dataset::Derived.find(@cast.area).dataset_dir
      Destroyer.preserve(paths.map { |basename| dir.join(basename) }, &block)
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
