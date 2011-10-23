group 'develop' do
  guard 'bundler' do
    watch('Gemfile')
    # Uncomment next line if Gemfile contain `gemspec' command
    # watch(/^.+\.gemspec/)
  end

  guard 'rspec', :version => 2 do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^plugins/(.+)\.rb$})     { |m| "spec/plugins/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
    watch('config/environment.rb')  { "spec" }
  end
end

group 'bot' do
  guard 'process', :name => 'bot', :command => 'ruby bin/live',
    :env => {}, :stop_signal => "USR1"  do

    watch('Gemfile.lock')
    watch(%r~plugins/.+$~)
    watch(%r~bin/.+$~)
  end
end



