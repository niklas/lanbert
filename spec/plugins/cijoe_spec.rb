require 'spec_helper'

describe Cijoe::Report do

  let(:report) do
    described_class.new({
      'PROJECT' => 'the project',
      'MESSAGE' => 'the message',
      'AUTHOR'  => 'the author',
      'SHA'     => 'the sha',
      'OUTPUT'  => 'the output',
      :channel  => 'the channel'
    })
  end

  it { report.project.should == 'the project' }
  it { report.message.should == 'the message' }
  it { report.author.should  == 'the author'  }
  it { report.sha.should     == 'the sha'     }
  it { report.output.should  == 'the output'  }
  it { report.channel.should == 'the channel' }

  it "should serialize for sending" do
    report.to_s.should == %Q~(the author) the message [the sha]~
  end

end

describe Cijoe do
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
  let(:plugin) { Cijoe.new bot }
  let(:report) { mock 'Report' }

  it "tells the channel about failed build" do
    Cijoe::Report.should_receive(:new).with(a: 23).and_return(report)
    plugin.should_receive(:tell).with('build failed', report)
    plugin.failed nil, a: 23
  end

  it "tells the channel about successful build" do
    Cijoe::Report.should_receive(:new).with(a: 42).and_return(report)
    plugin.should_receive(:tell).with('build successful', report)
    plugin.worked nil, a: 42
  end
end
