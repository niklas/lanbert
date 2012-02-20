require 'spec_helper'

RSpec::Matchers.define :exist_in_filesystem do
  match do |path|
    File.exists? path.to_s
  end
end

describe Bot do
  it "should provide root path" do
    Bot.should respond_to(:root)

    Bot.root.join('spec/spec_helper.rb').should exist_in_filesystem
  end

  it "should provide class accessor to array of plugins" do
    Bot.plugins.should be_a(Array)
    Bot.plugins.should_not be_empty
  end
end
