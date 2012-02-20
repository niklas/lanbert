require 'spec_helper'

describe DrbServer do
  let(:bot) do
    mock 'Bot'
  end
  let(:channel) do
    mock 'Channel'
  end
  let(:server) do
    described_class.new bot, channel
  end

  it "dispatches events on notify to the bot" do
    bot.should_receive(:dispatch).with(:deployed, nil, {:a => 23, :channel => channel})
    server.notify "deployed", { :a => 23 }
  end
end
