module Transformer
  class DatasetCast
    include Virtus.model
    include ActiveModel::Validations

    attribute :has_industry, Boolean, default: false
    attribute :has_agriculture, Boolean, default: false
    attribute :percentage_of_old_residences, Float, default: 0.0
    attribute :graph_methods, OpenStruct, default: -> (*) { OpenStruct.new }

    Atlas::Dataset.attribute_set.each do |attr|
      if attr.options[:proportional]
        attribute attr.name, Float
      end
    end

    validates_presence_of :number_of_residences
    validates :number_of_residences, numericality: { greater_than: 0 }
  end
end
