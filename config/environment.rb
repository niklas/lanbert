require 'rubygems'
require 'bundler/setup'

$:.unshift File.expand_path('../../lib', __FILE__)
require 'bot'

if Bot.debug?
  Bundler.require(:default, :development)
else
  Bundler.require(:default)
end

require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/string/conversions'

require 'responsive'

