require 'pathname'
class Bot
  class_attribute :root
  self.root = Pathname.new( File.dirname(__FILE__) ).join('..')
end

