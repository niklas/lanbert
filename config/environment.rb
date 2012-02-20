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
require 'drb_server'

Bot.plugins = Dir[ File.expand_path('../../plugins/*.rb', __FILE__) ].map do |rb|
  load rb
  File.basename(rb).sub(/\.rb$/,'').classify.constantize
end
