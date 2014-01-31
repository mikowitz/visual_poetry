require 'visual_poetry/version'
require 'visual_poetry/fragment'
require 'visual_poetry/poem'

module VisualPoetry
  def self.template(template_type)
    File.join(File.dirname(__FILE__), 'visual_poetry', 'templates', "#{template_type}.template")
  end
end
