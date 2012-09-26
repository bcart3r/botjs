Bot = require('nodeBot').Bot

bot = new Bot
  nick: 'Irg'
  user: 'Irg'
  channels: ['#irgtalk']
  plugins: []

bot.connect 'irc.freenode.org', 6667

bot.on "hey there", (b, irc) ->
  b.msg irc.chan, "#{irc.user} you said hey there!!"