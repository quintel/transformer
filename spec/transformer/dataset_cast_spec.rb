require 'spec_helper'

describe Transformer::DatasetCast do
  it 'sets a dataset cast' do
    expect(Transformer::DatasetCast.new).to be_a(Transformer::DatasetCast)
  end
end
