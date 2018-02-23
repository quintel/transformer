require 'bundler'
Bundler.setup(:default)

require 'yaml'
require 'atlas'
require 'virtus'

require_relative 'transformer/base'
require_relative 'transformer/graph_methods'
require_relative 'transformer/dataset_cast'
require_relative 'transformer/caster'
require_relative 'transformer/caster/base'

require_relative 'transformer/caster/template'
require_relative 'transformer/caster/sector_switcher'
require_relative 'transformer/caster/area_attributes'
require_relative 'transformer/caster/exporter'
require_relative 'transformer/caster/agriculture'
require_relative 'transformer/caster/industry'
