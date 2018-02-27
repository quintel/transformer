module Transformer
  class DatasetCast
    include Virtus.model
    include ActiveModel::Validations

    attribute :base_dataset, Symbol
    attribute :area, String
    attribute :has_industry, Boolean, default: false
    attribute :has_agriculture, Boolean, default: false
    attribute :percentage_of_old_residences, Float, default: 0.0
    attribute :graph_methods, OpenStruct, default: -> (*) { OpenStruct.new }

    def self.with_atlas_attributes
      Atlas::Dataset.attribute_set.map do |attr|
        if attr.options[:proportional]
          yield(attr)
        end
      end
    end

    with_atlas_attributes do |attr|
      attribute attr.name, Float
    end

    # Validation
    validates_presence_of :number_of_residences
    validates :number_of_residences, numericality: { greater_than: 0 }

    def atlas_attributes
      names = self.class.with_atlas_attributes { |attr| attr.name }

      attributes.slice(*names)
    end
  end
end
