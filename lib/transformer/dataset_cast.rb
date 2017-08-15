module Transformer
  class DatasetCast
    include Virtus.model
    include Households
    include Buildings
    include Transport
    include Industry
    include Agriculture
    include Supply
    include Other

    attribute :number_of_inhabitants,              Integer, mandatory: true, unit: ''
    attribute :number_of_residences,               Float, mandatory: true, unit: ''
    attribute :number_of_residences_with_solar_pv, Integer, mandatory: true, unit: ''
    attribute :percentage_of_old_residences,       Float, mandatory: true, unit: '%'
  end
end
