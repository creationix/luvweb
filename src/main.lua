-- Load the luv bindings from the cwd
-- You must cd to this directory before starting this script.
local uv = require('luv')

-- One line require system using submodules for dependencies.
-- Change the lua search path to look for submodules in lib.
package.path = uv.cwd() .. "/lib/?/init.lua"

-- Install global pretty-printer for easy debugging
p = require('pretty-print').prettyPrint

p(_G)