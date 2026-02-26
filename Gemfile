source "https://rubygems.org"

gemspec

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rubel',    ref: '32ae1ea', github: 'quintel/rubel' #TODO: update once merged to master
gem 'refinery', ref: 'c308c6d', github: 'quintel/refinery' #TODO: update once merged to master
gem 'atlas',    ref: '89b1591', github: 'quintel/atlas' #TODO: update once merged to master

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
