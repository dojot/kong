
package = "pepkong"
version = "0.0-3"

local pluginName = "pepkong"

source = {
  url = "https://github.com/dojot/kong.git"
}
description = {
  summary = "A Kong plugin, that extract roles from a JWT token and make a request for a Policy Decision Point (PDP)",
  license = "GPL"
}
dependencies = {
  "lua ~> 5.1",
  "json4lua ~> 0.9.30-1"
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins."..pluginName..".handler"] = "kong/plugins/"..pluginName.."/handler.lua",
    ["kong.plugins."..pluginName..".schema"] = "kong/plugins/"..pluginName.."/schema.lua",
    ["kong.plugins."..pluginName..".utils"] = "kong/plugins/"..pluginName.."/utils.lua",
  }
}
