-- Load the luv bindings from the cwd
-- You must cd to this directory before starting this script.
local uv = require('luv')

-- One line require system using submodules for dependencies.
-- Change the lua search path to look for submodules in lib.
package.path = "?.lua;" .. uv.cwd() .. "/lib/?/init.lua"

-- Install global pretty-printer for easy debugging
p = require('pretty-print').prettyPrint

require('main')

-- Start the libuv event loop
uv.run()
