# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Transformer::FileKeys do
  let(:keys) { described_class.all }

  it 'creates Cell instances for each row/column combination' do
    expect(keys.length).to eq(4)
  end

  it 'creates a cell for small,x carrier data' do
    expect(keys[:file_carriers_small_x]).to be_a(Transformer::FileKeys::Cell)
  end

  it 'creates a cell for small,y carrier data' do
    expect(keys[:file_carriers_small_y]).to be_a(Transformer::FileKeys::Cell)
  end

  it 'creates a cell for large,x carrier data' do
    expect(keys[:file_carriers_large_x]).to be_a(Transformer::FileKeys::Cell)
  end

  it 'creates a cell for large,y carrier data' do
    expect(keys[:file_carriers_large_y]).to be_a(Transformer::FileKeys::Cell)
  end

  describe 'Cell attributes' do
    let(:cell) { keys[:file_carriers_small_x] }

    it 'sets the file key' do
      expect(cell.file).to eq('carriers')
    end

    it 'sets the row key' do
      expect(cell.row).to eq(:small)
    end

    it 'sets the column key' do
      expect(cell.column).to eq(:x)
    end
  end
end
