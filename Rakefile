require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :default do |spec|
  spec.pattern = "./spec/**/*_spec.rb"
end
