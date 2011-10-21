group 'develop' do
  guard 'bundler' do
    watch('Gemfile')
    # Uncomment next line if Gemfile contain `gemspec' command
    # watch(/^.+\.gemspec/)
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

