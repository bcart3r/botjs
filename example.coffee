irg = require './bot'
getTime = require('./plugins/time').getTime

bot = new irg.Bot
  nick: 'Irg'
  user: 'Irg'
  channels: ['#irgtalk']
  plugins: [getTime]

bot.connect 'irc.freenode.org', 6667

bot.on "hey there", (b, irc) ->
  b.msg irc.chan, "#{irc.user} you said hey there!!"