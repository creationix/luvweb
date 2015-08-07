-- Load a couple libraries to query a REST server and parse the results.
local request = require('coro-http').request
local createServer = require('coro-http').createServer
local jsonParse = require('json').parse

-- Run our logic in a coroutine so we can block on I/O
coroutine.wrap(function ()
  local res, body = request("GET", "https://lit.luvit.io/")
  p(res)
  p(jsonParse(body))
end)()

createServer({
  host = "0.0.0.0",
  port = 8000
}, function (req, body, socket)
  p{req=req,body=body,socket=socket}
  local body = "Hello World\n"
  return {
    code = 200,
    {"Content-Type", "text/plain"},
    {"Content-Length", #body},
  }, body
end)
print("coro-http server listening on http://localhost:8000/")
