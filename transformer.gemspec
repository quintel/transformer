lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transformer/version'

Gem::Specification.new do |gem|
  gem.name          = 'transformer'
  gem.version       = Transformer::VERSION
  gem.authors       = ["Gerard Westerhof"]
  gem.email         = ["gerard.westerhof@quintel.com"]
  gem.description   = %q{Data transformer for ETM}
  gem.summary       = %q{}
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/quintel/transformer'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'atlas',  '~> 1.0'
  gem.add_dependency 'virtus', '~> 1.0'
  gem.add_dependency 'virtus-group', '~> 0.3'

  gem.add_development_dependency 'pry', '~> 0.9'
end
