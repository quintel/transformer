require 'spec_helper'

module Transformer
  RSpec.describe Caster::Template do
    it 'creates a template' do
      template = described_class.new

      expect(template.dump).to eq({
        area: {},
        graph_values: {},
        file_values: {}
      })
    end

    context 'knows what to do with which variable' do
      it "area attributes" do
        template = described_class.new

        template.add_area(:number_of_households, 5)

        expect(template.dump).to include(
          area: { number_of_households: 5 }
        )
      end

      it 'file_values' do
        template = described_class.new

        c1 = FileKeys::Cell.new(:a, :b, :c)
        c2 = FileKeys::Cell.new(:x, :y, :z)

        template.add_file_value(c1, 10.0)
        template.add_file_value(c2, 20.0)

        expect(template.dump).to include(
          file_values: { a: { c1 => 10.0 }, x: { c2 => 20.0 } }
        )
      end

      it "graph methods" do
        template = described_class.new

        template.add_graph_value(
          GraphMethods::GraphAttribute.new(
            Float,
            :households_final_demand_for_electricity,
            'demand'
          ),
          5
        )

        expect(template.dump).to include(
          graph_values: {
            'households_final_demand_for_electricity' => {
              'demand' => 5.0
            }
          }
        )
      end
    end
  end
end
