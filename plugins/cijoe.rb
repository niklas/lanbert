require 'drb'
class Cijoe
  include Cinch::Plugin

  listen_to :failed, :method => :failed
  def failed(m, args)
    tell "build_failed", Report.new(args)
  end

  listen_to :worked, :method => :worked
  def worked(m, report)
    tell "build_success", Report.new(args)
  end

  private

  def tell(message, report)
    full = "#{message}: #{report}"
    channel = report.channel || bot.channels.first.name
    Channel(channel).send(full)
  end

  class Report
    Wanted = %w(PROJECT MESSAGE AUTHOR SHA OUTPUT)
    Wanted.each do |wanted|
      attr_accessor wanted.downcase.to_sym
    end
    attr_reader :channel
    def initialize(env)
      @channel = env.delete(:channel)
      Wanted.each do |wanted|
        self.send("#{wanted.downcase}=", env[wanted])
      end
    end
    def to_s
      %Q~(#{author}) #{message} [#{sha}]~
    end

  end

end
