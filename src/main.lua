-- Load the luv bindings from the cwd
-- You must cd to this directory before starting this script.
local uv = require('luv')

-- One line require system using submodules for dependencies.
-- Change the lua search path to look for submodules in lib.
package.path = uv.cwd() .. "/lib/?/init.lua"

-- Install global pretty-printer for easy debugging
p = require('pretty-print').prettyPrint

local connect = require('coro-net').connect
coroutine.wrap(function ()
  local read, write, socket = connect({
    host = "lit.luvit.io",
    port = 80
  })
  p(read, write, socket)
  write("GET / HTTP/1.0\r\nHost: lit.luvit.io\r\n\r\n")
  for chunk in read do
    p(chunk)
  end
  write()
end)()

uv.run()
