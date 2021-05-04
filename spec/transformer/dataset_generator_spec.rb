# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'a dataset generator with file values' do
  context 'with no custom file values' do
    it 'does not create a file' do
      basename = parent.carriers.path.relative_path_from(parent.dataset_dir)
      expect(dataset.dataset_dir.join(basename)).not_to be_exist
    end
  end

  context 'with custom file values which match the original' do
    let(:params) { { file_carriers_small_x: 1.0 } }

    it 'does not create a file' do
      basename = parent.carriers.path.relative_path_from(parent.dataset_dir)
      expect(dataset.dataset_dir.join(basename)).not_to be_exist
    end
  end

  context 'with custom file values which are nil' do
    let(:params) { { file_carriers_small_x: nil } }

    it 'does not create a file' do
      basename = parent.carriers.path.relative_path_from(parent.dataset_dir)
      expect(dataset.dataset_dir.join(basename)).not_to be_exist
    end
  end

  context 'with custom file values which are different to the original' do
    let(:params) { { file_carriers_small_x: 100.0 } }

    # Ensure we get a fresh copy from disk.
    let(:csv) { Atlas::CSVDocument.new(dataset.carriers.path) }

    it 'does not symlink the parent file' do
      expect(dataset.carriers.path.realpath).not_to eq(parent.carriers.path.realpath)
    end

    it 'creates a CSV file' do
      expect(dataset.carriers.path).to be_file
    end

    it 'sets the custom value' do
      expect(csv.get(:small, :x)).to eq(100.0)
    end

    it 'preserves the original, non-customised values in the same row' do
      expect(csv.get(:small, :y)).to eq(2.0)
    end

    it 'preserves the original, non-customised values in the same column' do
      expect(csv.get(:large, :x)).to eq(10.0)
    end
  end
end

RSpec.describe Transformer::DatasetGenerator do
  describe 'existing datasets' do
    let(:params) { {} }
    let(:parent) { Atlas::Dataset.find(:nl) }

    let!(:dataset) do
      described_class.new({
        area: 'ameland',
        base_dataset: parent.key,
        number_of_residences: 2,
        number_of_new_residences: 1.5
      }.merge(params)).generate

      Atlas::Dataset.find(:ameland)
    end

    it 'updates an existing dataset' do
      expect(dataset.number_of_residences).to eq(2)
    end

    include_examples 'a dataset generator with file values'
  end

  describe 'new datasets' do
    let(:params) { {} }
    let(:parent) { Atlas::Dataset.find(:nl) }

    let!(:dataset) do
      described_class.new({
        area: 'test',
        base_dataset: parent.key.to_s,
        number_of_residences: 25,
        number_of_new_residences: 24.5,
        number_of_cars: 100,
        # In this test setup this attribute will be multiplied by 5 in order
        # to end up with a demand for households_final_demand_electricity
        # of 25
        etlocal_households_test: 5
      }.merge(params)).generate

      Atlas::Dataset.find(:test)
    end

    it 'creates a dataset' do
      expect(Atlas::Dataset::Derived.find(:test)).not_to be_nil
    end

    it 'sets the number of residences' do
      expect(dataset.number_of_residences).to eq(25)
    end

    it 'sets the number of cars' do
      expect(dataset.number_of_cars).to eq(100)
    end

    it 'sets the final demand of households with a graph method' do
      expect(dataset.graph_values.values).to eq(
        'households_final_demand_electricity' => {
          'demand' => 42
        },
        'households_final_demand_for_hot_water_electricity' => {
          'demand' => 210
        }
      )
    end

    include_examples 'a dataset generator with file values'
  end
end
