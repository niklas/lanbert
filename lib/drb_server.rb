require 'drb'
class DrbServer
  def self.listen(*a)
    new(*a).start
  end

  attr_reader :bot, :channel
  def initialize(bot, channel)
    @bot = bot
    @channel = channel
  end

  Events = %w(worked failed deployed)

  def notify(event, args={})
    if Events.include?(event)
      bot.dispatch(event.to_sym, nil, args.to_hash.merge(:channel => channel))
    end
  end

  def start
    DRb.start_service 'druby://localhost:5678', self
    DRb.thread.join
  end

end
  

