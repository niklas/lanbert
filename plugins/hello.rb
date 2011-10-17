class Hello
  include Cinch::Plugin

  Greeting = /\b(hello|hi|hallo|hallihallo|na|welcome|howdy|oi|oioi|greetings|fuck)\b/i

  prefix lambda{ |m| m.bot.nick + ": " }
  match Greeting, :use_prefix => false

  def execute(m)
    if m.message =~ Greeting
      m.reply "#{$1} yourself, #{m.user.nick}"
    end
  end
end
