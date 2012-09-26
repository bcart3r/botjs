net = require 'net'

LineMatcher = /:(.+)!.+ (.+) (#.+) :(.+)/

class Irc
  constructor: (args) ->
    @nick = args.nick
    @user = args.user
    @channels = args.channels
    @plugins = args.plugins

  connect: (host, port) =>
    @sock = net.connect {host: host, port: port}
    @sock.on 'connect', @connHandler
    @sock.on 'data', @dataHandler

  write: (msg) =>
    @sock.write "#{msg}\r\n"

  connHandler: =>
    @write "NICK #{@nick}"
    @write "USER #{@nick} 0 * :#{@user}"
    for chan in @channels
      @write "JOIN #{chan}"
    

  dataHandler: (data) =>
    lines = data.toString().split('\n')
    for line in lines
      console.log line

      if line.search("PING") != -1
        msg = /:.*/
        @write "PONG #{line.match(msg)[0]}"

      for plugin in @plugins
        if line.match(plugin.matcher)
          matches = LineMatcher.exec(line)
          ircMap =
            user: matches[1]
            type: matches[2]
            chan: matches[3]
            msg:  matches[4]
            
          plugin.callback(@, ircMap)

exports.Irc = Irc