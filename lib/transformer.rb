require 'bundler'
Bundler.setup(:default)

require 'yaml'
require 'atlas'
require 'virtus'

require_relative 'transformer/runtime'
require_relative 'transformer/dataset_generator'
require_relative 'transformer/dataset_generator/scaler'
require_relative 'transformer/dataset_generator/destroyer'
require_relative 'transformer/dataset_generator/analyzer'
require_relative 'transformer/dataset_generator/validator'
require_relative 'transformer/base'
require_relative 'transformer/graph_methods'
require_relative 'transformer/dataset_cast'
require_relative 'transformer/filter'
require_relative 'transformer/file_keys'
require_relative 'transformer/caster'
require_relative 'transformer/caster/base'

require_relative 'transformer/caster/template'
require_relative 'transformer/caster/area_attributes'
require_relative 'transformer/caster/exporter'
require_relative 'transformer/caster/file_values'
