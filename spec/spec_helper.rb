require 'rubygems'
require 'bundler/setup'
require 'visual_poetry'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end
