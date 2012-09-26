var Bot = require('botjs').Bot;

var bot = new Bot({
  nick: 'kewlbot',
  user: 'bcart3r',
  channels: ['#kewlstuff'],
  plugins: []
});

bot.connect('irc.freenode.org', 6667);

bot.on('sup kewlbot', function(b, irc) {
  b.msg(irc.chan, 'brooo how ya been ' + irc.user);
});

bot.on('join', function(b, irc) {
  var msg;

  if (b.nick === irc.nick) {
    msg = "Hello Everybody!";
  } else {
    msg = "Welcome " + irc.nick;
  }

  bot.msg irc.chan, msg;
});