# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Transformer::FileKeys do
  let(:keys) { described_class.all }

  it 'creates EditableCell instances for each row/column combination' do
    expect(keys.length).to eq(4)
  end

  it 'creates a cell for small,x carrier data' do
    expect(keys[:file_carrier_data_small_x]).to be_a(Transformer::FileKeys::EditableCell)
  end

  it 'creates a cell for small,y carrier data' do
    expect(keys[:file_carrier_data_small_y]).to be_a(Transformer::FileKeys::EditableCell)
  end

  it 'creates a cell for large,x carrier data' do
    expect(keys[:file_carrier_data_large_x]).to be_a(Transformer::FileKeys::EditableCell)
  end

  it 'creates a cell for large,y carrier data' do
    expect(keys[:file_carrier_data_large_y]).to be_a(Transformer::FileKeys::EditableCell)
  end

  describe 'EditableCell attributes' do
    let(:cell) { keys[:file_carrier_data_small_x] }

    it 'sets the file key' do
      expect(cell.file).to eq('carrier_data')
    end

    it 'sets the row key' do
      expect(cell.row).to eq(:small)
    end

    it 'sets the column key' do
      expect(cell.column).to eq(:x)
    end
  end
end
