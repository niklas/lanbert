describe Capistrano do
  let(:bot) do
    Cinch::Bot.new do
      configure do |c|
        c.server          = 'the server'
        c.nick            = 'ololadin'
        c.channels        = ['nr5']
        c.verbose         = true
        c.plugins.plugins = []
      end
    end
  end

  let(:version) { '0.0.7 james-bond-edition' }
  let(:plugin)  { described_class.new bot }

  it "tells the channel about failed build" do
    plugin.should_receive(:tell).with("new version deployed: #{version}")
    plugin.deployed nil, version
  end

end

