require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'visual_poetry'
require 'fileutils'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include FixtureHelpers

  config.before(:each, files: true) do |example|
    FileUtils.mkdir 'spec/generated_files' unless File.exist?('spec/generated_files')
  end

  config.after(:each, files: true) do |example|
    FileUtils.rm_r 'spec/generated_files' unless !!example.exception
  end
end
