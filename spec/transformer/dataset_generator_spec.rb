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
    let(:csv) { Atlas::CSVDocument.read(dataset.carriers.path) }

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

    let!(:generator) do
      described_class.new({
        area: 'ameland',
        base_dataset: parent.key,
        present_number_of_residences: 2,
        number_of_inhabitants: 10,
        number_of_new_residences: 1.5
      }.merge(params))
    end

    let(:dataset) do
      generator.generate
      Atlas::Dataset.find(:ameland)
    end

    it 'updates an existing dataset' do
      expect(dataset.present_number_of_residences).to eq(2)
    end

    include_examples 'a dataset generator with file values'
  end

  describe 'preserving files in an existing dataset' do
    let!(:generator) do
      described_class.new(
        area: 'ameland',
        base_dataset: :nl,
        present_number_of_residences: 2,
        number_of_inhabitants: 10,
        number_of_new_residences: 1.5
      )
    end

    let(:dir) { dataset.dataset_dir.join('a/directory') }
    let(:nested_file) { dataset.dataset_dir.join('a/deeply/nested/file.txt') }
    let(:dataset) { Atlas::Dataset.find(:ameland) }

    before do
      dir.mkpath
      dir.join('file.txt').write('hello')

      nested_file.dirname.mkpath
      nested_file.write('goodbye')

      generator.preserve_paths(['a/directory', 'a/deeply/nested/file.txt', 'doesnt/exist']) do
        generator.generate
      end
    end

    it 'preserves directories' do
      expect(dir).to be_directory
    end

    it 'preserves the contents of directories' do
      expect(dir.join('file.txt').read).to eq('hello')
    end

    it 'preserves nested files' do
      expect(nested_file.read).to eq('goodbye')
    end

    it 'does not create files which did not exist' do
      expect(dataset.dataset_dir.join('doesnt/exist')).not_to be_exist
    end
  end

  describe 'new datasets' do
    let(:params) { {} }
    let(:parent) { Atlas::Dataset.find(:nl) }

    let!(:dataset) do
      described_class.new({
        area: 'test',
        base_dataset: parent.key.to_s,
        present_number_of_residences: 25,
        number_of_inhabitants: 100,
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
      expect(dataset.present_number_of_residences).to eq(25)
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

  describe 'preserving non-existent files in a new dataset' do
    let!(:generator) do
      described_class.new(
        area: 'test',
        base_dataset: :nl,
        present_number_of_residences: 2,
        number_of_inhabitants: 10,
        number_of_new_residences: 1.5
      )
    end

    before do
      generator.preserve_paths(['a/directory', 'a/deeply/nested/file.txt']) do
        generator.generate
      end
    end

    let(:dataset) { Atlas::Dataset.find(:test) }

    it 'does not create directories' do
      expect(dataset.dataset_dir.join('a/directory')).not_to be_exist
    end

    it 'does not create files' do
      expect(dataset.dataset_dir.join('a/deeply/nested/file.txt')).not_to be_exist
    end
  end
end
