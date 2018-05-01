require 'spec_helper'

module Transformer
  RSpec.describe Caster::Template do
    it 'creates a template' do
      template = Caster::Template.new

      expect(template.dump).to eq({
        area: {},
        graph_values: {}
      })
    end

    context 'knows what to do with which variable' do
      it "area attributes" do
        template = Caster::Template.new

        template.add_area(:number_of_households, 5)

        expect(template.dump).to eq({
          area: { number_of_households: 5 },
          graph_values: {}
        })
      end

      it "graph methods" do
        template = Caster::Template.new

        template.add_graph_value(
          GraphMethods::GraphAttribute.new(
            Float,
            :households_final_demand_for_electricity,
            'demand'
          ),
          5
        )

        expect(template.dump).to eq({
          area: { },
          graph_values: {
            'households_final_demand_for_electricity' => {
              'demand' => 5.0
            }
          }
        })
      end
    end
  end
end
