class Capistrano
  include Cinch::Plugin

  listen_to :deployed, :method => :deployed
  def deployed(m, version)
    tell "new version deployed: #{version}"
  end

  private

  def tell(message)
    channel = bot.channels.first.name
    Channel(channel).send(message)
  end
end
