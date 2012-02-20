require 'pathname'
require 'ostruct'
class Bot
  def self.root
    @@root ||= Pathname.new( File.dirname(__FILE__) ).join('..')
  end

  def self.config
    @config ||= load_config
  end

  def self.plugins=(found_plugins)
    @plugins = found_plugins
  end

  def self.plugins
    @plugins || []
  end

  def self.load_config
    parsed_yaml = YAML.parse_file(File.expand_path('../../config.yml', __FILE__)).to_ruby
    OpenStruct.new parsed_yaml
  end

  def self.debug?
    localhost != config.host
  end

  def self.localhost
    @localhost ||= `hostname`.chomp
  end
end

