#BotJs
----------------------------------------------------

##Install
    npm install botjs

##Description

botjs is a Simple module for writing irc bots in NodeJs.

botjs uses a plugin based system for interacting with the Irc connection. 

Each plugin defined in the bots plugins array must be an Object which contains a property called matcher and a method called callback which will be evaluated when theres a match on the matcher property. 

Matcher is a String containing a Regexp to be matched over the current line read in from the Irc Connection.

A plugins callback method should contain two parameters. The first being the instance of the bot itself. The second is an Object containing information about the current line being matched against.

###Example Plugins
####CoffeeScript
    sayHey = {}
    sayHey.matcher = "!hey"
    sayHey.callback = (bot, irc) ->
      bot.msg irc.chan, "well hey there #{irc.user}"

    exports.sayHey = sayHey

####JavaScript
    var sayHey = {};
    sayHey.matcher = '!hey';
    sayHey.callback = function(bot, irc) {
      bot.msg(irc.chan, "well hey there " + irc.user);
    };

    exports.sayHey = sayHey;