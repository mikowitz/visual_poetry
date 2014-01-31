require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'visual_poetry'
require 'fileutils'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include FixtureHelpers
end
