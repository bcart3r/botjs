irc = require './irc'

class Bot extends irc.Irc
  msg: (chan, msg) =>
    @write "PRIVMSG #{chan} :#{msg}"

  pm: (user, msg) =>
    @write "PRIVMSG #{user} :#{msg}"

  join: (args...) =>
    msg = "JOIN #{args[0]} :#{args[1]}" if args[1] else "JOIN #{args[0]}"
    @write msg

  changeNick: (nick) =>
    @nick = nick
    @write "NICK #{nick}"

  part: (chan) =>
    @write "PART #{chan}"

  on: (match, callback) =>
    switch match
      when 'join'
        @plugins.push {matcher: "JOIN", callback: callback}
      else
        @plugins.push {matcher: match, callback: callback}

  quit: (reason) =>
    @write "QUIT :#{reason}"

exports.Bot = Bot