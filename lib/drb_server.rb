class DrbServer
  def self.listen(*a)
    new(*a).start
  end

  attr_reader :bot, :channel
  def initialize(bot, channel)
    @bot = bot
    @channel = channel
  end

  def notify(status, args={})
    report = Report.new(channel, args.to_hash)

    case status
    when 'worked'
      bot.dispatch(:worked, nil, report)
    when 'failed'
      bot.dispatch(:failed, nil, report)
    end
  end

  def start
    DRb.start_service 'druby://localhost:5678', self
    DRb.thread.join
  end

end
  

