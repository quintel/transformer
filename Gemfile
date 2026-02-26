source "https://rubygems.org"

gemspec

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rubel',    ref: 'ad3d44e', github: 'quintel/rubel'
gem 'refinery', ref: 'dc1485d', github: 'quintel/refinery' # TODO: update ref once merged to master
gem 'atlas',    ref: '4086af7', github: 'quintel/atlas' # TODO: update ref once merged to master

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
