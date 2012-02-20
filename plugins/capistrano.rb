class Capistrano
  include Cinch::Plugin

  listen_to :deployed, :method => :deployed
  def deployed(m, args={})
    if version = args['version']
      tell "new version deployed: #{version}"
    else
      tell "new version deployed"
    end
  end

  private

  def tell(message)
    channel = bot.channels.first.name
    Channel(channel).send(message)
  end
end
