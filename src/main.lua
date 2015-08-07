-- Load a couple libraries to query a REST server and parse the results.
local request = require('coro-http').request
local jsonParse = require('json').parse

-- Run our logic in a coroutine so we can block on I/O
coroutine.wrap(function ()
  local res, body = request("GET", "https://lit.luvit.io/")
  p(res)
  p(jsonParse(body))
end)()
