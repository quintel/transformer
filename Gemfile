source "https://rubygems.org"

gemspec

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rubel',    ref: 'ad3d44e', github: 'quintel/rubel'
gem 'refinery', ref: 'c39c9b1', github: 'quintel/refinery'
gem 'atlas',    ref: '311b2a6', github: 'quintel/atlas'

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :test do
  gem 'rspec'
  gem 'simplecov'
  gem 'byebug'
end
