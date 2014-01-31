require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'visual_poetry'
require 'fileutils'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include FixtureHelpers

  config.before(:all) do |example|
    @@can_delete_generated_files = true
  end

  config.before(:each, files: true) do |example|
    FileUtils.mkdir 'spec/generated_files' unless File.exist?('spec/generated_files')
  end
   
  config.after(:each, files: true) do |example|
    @@can_delete_generated_files = false if !!example.exception
  end

  config.after(:all) do
    FileUtils.rm_r 'spec/generated_files' if @@can_delete_generated_files
  end
end
