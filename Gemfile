source "https://rubygems.org"

gemspec

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rubel',    ref: '9fe7010', github: 'quintel/rubel'
gem 'refinery', ref: '36b8e34', github: 'quintel/refinery'
gem 'atlas',    ref: 'f0fb6be', github: 'quintel/atlas'

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'byebug'
end
