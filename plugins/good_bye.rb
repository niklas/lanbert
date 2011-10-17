# encoding: utf-8

class GoodBye
  include Cinch::Plugin

  Messages = [
    'good bye',
    'goodbye',
    'cu',
    'bye',
    'kthxbai',
    'ciao',
    'winkewinke',
    'tschüssi',
    'later, alligator',
    'cu2, kangaroo'
  ]

  listen_to :good_bye, :method => :good_bye
  def good_bye(m)
    bot.channels.each do |channel| 
      channel.send Messages.sample
    end
    bot.quit
  end
end
