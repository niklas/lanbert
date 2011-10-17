module Responsive
  def self.included(base)
    base.class_eval do
      include Cinch::Plugin
      prefix lambda{ |m| m.bot.nick + ": " }
    end
  end
end
