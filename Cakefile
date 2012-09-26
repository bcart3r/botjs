fs = require 'fs'
{print} = require 'util'
{spawn, exec} = require 'child_process'

task "build", "Compile coffeescript to js.", ->
  console.log "Building.."
  launch 'coffee', ['-c', '-o', 'lib', 'src'], () ->
    console.log "Completed!"


launch = (cmd, options=[], callback) ->
  app = spawn cmd, options
  app.stdout.pipe(process.stdout)
  app.stderr.pipe(process.stderr)
  app.on 'exit', (status) -> callback?() if status is 0