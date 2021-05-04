module Transformer
  class DatasetGenerator
    # Removes a dataset.
    module Destroyer
      module_function

      def call(cast)
        Atlas::Dataset::Derived.exists?(cast.area) &&
          Atlas::Dataset::Derived.find(cast.area).destroy!
      end

      # Public: May be used to wrap around a Destroyer. This will ensure that the named files or
      # directories are restored after the destroyer has been executed.
      def preserve(paths)
        return yield if paths.empty?

        map = {}
        tmp_dir = Pathname.new(Dir.mktmpdir)

        paths.each do |path|
          next unless path.exist?

          tmp_path = tmp_dir.join(SecureRandom.hex)

          if tmp_path.exist?
            raise "Collision when preserving path #{path}. This is likely a random error; " \
                  'please try again.'
          end

          map[path] = tmp_path
          FileUtils.mv(path, tmp_dir.join(tmp_path))
        end

        yield
      ensure
        map.each do |path, tmp_path|
          path.dirname.mkpath
          FileUtils.mv(tmp_path, path)
        end

        tmp_dir.rmtree if tmp_dir.exist?
      end
    end
  end
end
