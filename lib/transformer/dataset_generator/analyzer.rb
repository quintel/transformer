# frozen_string_literal: true

module Transformer
  class DatasetGenerator
    # Saves the values to the dataset, graph values, and files.
    class Analyzer
      def self.call(cast)
        new(cast).call
      end

      def call
        update_dataset
        save_graph_values
        save_file_values

        @cast
      end

      private

      def initialize(cast)
        @cast = cast
        @values = Caster.cast(cast)
        @dataset = Atlas::Dataset::Derived.find(cast.area)
      end

      def update_dataset
        @dataset.update_attributes!(@values.fetch(:area))
      end

      # Internal: Persists values about nodes and edges in the graph_values.yml file.
      def save_graph_values
        @dataset.graph_values.values = @values.fetch(:graph_values)
        @dataset.graph_values.save
      end

      # Internal: Persists values which are stored in dataset CSV files.
      def save_file_values
        parent = @dataset.parent

        @values.fetch(:file_values).each do |file_key, value_map|
          parent_file = parent.public_send(file_key)

          any_changes = value_map.any? do |cell, value|
            # Only includes values which are significantly different from the default. This may not
            # be future-proof, but at the time of writing we only edit carriers for which 4DP is
            # sufficient.
            #
            # See https://github.com/quintel/etlocal/issues/315
            value.round(4) != parent_file.get(cell.row, cell.column).round(4)
          end

          next unless any_changes

          basename = parent_file.path.relative_path_from(parent.dataset_dir)

          create_file_from_parent(
            parent_file.path,
            @dataset.dataset_dir.join(basename),
            value_map
          )
        end
      end

      # Internal: Creates a duplicate of the original parent file at the same location in the new
      # dataset.
      #
      # We create a duplicate rather than using the file which already exists in case the file
      # already exists, with hand-edits; those need to be removed, and the CSV reset to the same
      # structure as the parent.
      def create_file_from_parent(original_path, new_path, value_map)
        assert_non_linked_parent(new_path)

        new_path.unlink if new_path.exist?

        FileUtils.cp(original_path, new_path)

        file = Atlas::CSVDocument.new(new_path)

        value_map.each do |cell, value|
          file.set(cell.row, cell.column, value)
        end

        file.save!(follow_link: false)
        file.path.chmod(0o444)
      end

      # Internal: Asserts that the directory in which a `path` will be created is not a symlink.
      #
      # This prevents us from changing files in the parent dataset. Ideally what we'd do here is
      # traverse up the directory tree (as far as the dataset dir), replacing directory symlinks
      # with real dirs, and symlinking their contents instead, but for now, this suffices.
      #
      # Returns nothing. Raises a RuntimeError if the parent is a symlink.
      def assert_non_linked_parent(path)
        dir = path.dirname.relative_path_from(@dataset.dataset_dir)
        real_dir = path.dirname.realpath.relative_path_from(@dataset.dataset_dir.realpath)

        raise "Cannot create #{path} when parent directory is a symlink" if dir != real_dir
      end
    end
  end
end
