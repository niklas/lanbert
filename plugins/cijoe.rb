require 'drb'
class Cijoe
  include Cinch::Plugin

  listen_to :failed, :method => :failed
  def failed(m, report)
    tell %Q~build failed: #{format_report report}~, report
  end

  listen_to :worked, :method => :worked
  def worked(m, report)
    tell %Q~build success: #{format_report report}~, report
  end

  private

  def format_report(report)
    %Q~(#{report.author}) #{report.message} [#{report.sha}]~
  end

  def tell(message, report)
    channel = report.channel || bot.channels.first.name
    Channel(channel).send(message)
  end

  class Report
    Wanted = %w(PROJECT MESSAGE AUTHOR SHA OUTPUT)
    Wanted.each do |wanted|
      attr_accessor wanted.downcase.to_sym
    end
    attr_reader :channel
    def initialize(channel, env)
      @channel = channel
      Wanted.each do |wanted|
        self.send("#{wanted.downcase}=", env[wanted])
      end
    end
  end

  class Server
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
  
end
