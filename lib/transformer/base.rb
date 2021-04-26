# frozen_string_literal: true

# Contains all the Transformer functionality for converting ETLocal params to a fully-functional
# dataset.
module Transformer
  def self.root
    @root ||= Pathname.new(File.expand_path('../..', __dir__))
  end

  def self.root=(path)
    @root = Pathname.new(path)
  end

  def self.canonical_dataset
    raise 'No canonical_dataset_key has been set on Transformer' if @canonical_dataset_key.nil?

    Atlas::Dataset.find(@canonical_dataset_key)
  end

  def self.canonical_dataset_key=(key)
    @canonical_dataset_key = key.to_sym
  end
end
