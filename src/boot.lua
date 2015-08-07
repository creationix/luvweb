-- You must cd to this directory before starting this script.

-- Tiny require system using local submodules for dependencies.
-- Change the lua search path to look for submodules in lib.
local cpath = package.cpath
package.cpath = "lib/?.so"
local uv = require('luv')
local cwd = uv.cwd()
package.path = cwd .. "/lib/?.lua;" .. cwd .. "/lib/?/init.lua;" .. package.path
package.cpath = cwd .. "/lib/?.so;" .. cpath

-- Install global pretty-printer for easy debugging
p = require('pretty-print').prettyPrint

require('http-sample')
require('weblit-sample')

-- Start the libuv event loop
uv.run()
