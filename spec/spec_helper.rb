# frozen_string_literal: true

require_relative '../lib/transformer'

Bundler.require(:test)

Transformer.root = Transformer.root.join('spec/fixtures')
Transformer.canonical_dataset_key = :nl

require_relative 'support/fixtures'

RSpec.configure do |config|
  # Use only the new "expect" syntax.
  config.expect_with(:rspec) { |c| c.syntax = :expect }

  # Tries to find examples / groups with the focus tag, and runs them. If no
  # examples are focues, run everything. Prevents the need to specify
  # `--tag focus` when you only want to run certain examples.
  config.filter_run(focus: true)
  config.run_all_when_everything_filtered = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Use a (safe) copy of spec/fixtures as the data-source.
  config.include Transformer::Spec::Fixtures
end
