# frozen_string_literal: true

module Transformer
  # Maps keys in editable CSV files to their path, row, and column.
  module FileKeys
    # A list of CSV documents exposed by Atlas::Dataset
    EDITABLE_FILES = %w[carrier_data].freeze

    # A map containing the key of the file, and the keys of the row and column which may be edited.
    EditableCell = Struct.new(:file, :row, :column)

    module_function

    def all
      @all ||= build_key_map
    end

    def build_key_map
      # Consider files in the NL dataset to be canonical; CSV files in other datasets should have
      # the same rows and columns.
      dataset = Transformer.canonical_dataset

      EDITABLE_FILES.each_with_object({}) do |file_key, data|
        file = dataset.public_send(file_key)

        file.row_keys.each do |row_key|
          file.column_keys[1..].each do |column_key|
            data[:"file_#{file_key}_#{row_key}_#{column_key}"] =
              EditableCell.new(file_key, row_key, column_key)
          end
        end
      end
    end

    private_class_method :build_key_map
  end
end
