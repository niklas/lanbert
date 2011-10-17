class Hello
  include Responsive

  Greeting = /\b(hello|hi|hallo|hallihallo|na|welcome|howdy|oi|oioi|greetings|fuck)\b/i

  match Greeting

  def execute(m)
    if m.message =~ Greeting
      m.reply "#{$1} yourself, #{m.user.nick}"
    end
  end
end
