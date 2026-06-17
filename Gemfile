# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'tsort'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'atlas',    ref: 'db94f40', github: 'quintel/atlas'
gem 'refinery', ref: '36b8e34', github: 'quintel/refinery'
gem 'rubel',    ref: '9fe7010', github: 'quintel/rubel'

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :test do
  gem 'byebug'
  gem 'rspec'
  gem 'simplecov', require: false
end
