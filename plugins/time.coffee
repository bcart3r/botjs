getTime = {}

getTime.matcher = "!time"

getTime.callback = (b, irc) ->
  t = new Date()
  a = ""
  if t.getHours() > 12
    a = "#{t.getHours() - 12}:#{t.getMinutes()} pm"
  else if t.getHours() == 12
    a = "12:#{t.getMinutes()} pm"
  else if t.getHours() == 24
    a = "12:#{t.getMinutes()} am"
  else
    a = "#{t.getHours()}:#{t.getMinutes()} am"
  
  b.msg irc.chan, "#{irc.user} the time is #{a}"

exports.getTime = getTime
