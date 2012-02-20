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
