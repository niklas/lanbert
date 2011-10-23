require 'rubygems'
require 'bundler/setup'

require 'ostruct'
parsed_yaml = YAML.parse_file(File.expand_path('../../config.yml', __FILE__)).to_ruby
config = OpenStruct.new parsed_yaml

localhost = `hostname`.chomp
debug = localhost != config.host

if debug
  Bundler.require(:default, :development)
else
  Bundler.require(:default)
end

require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/string/conversions'

$:.unshift File.expand_path('../../lib', __FILE__)
require 'responsive'
require 'bot'

