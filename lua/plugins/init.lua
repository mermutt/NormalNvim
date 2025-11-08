-- Initialize all plugin specs
local function extend(t1, t2)
  for _, v in ipairs(t2) do
    table.insert(t1, v)
  end
  return t1
end

local specs = {}

-- Load each plugin file and extend the specs table
specs = extend(specs, require("plugins.1-base-behaviors"))
specs = extend(specs, require("plugins.2-ui"))
specs = extend(specs, require("plugins.3-dev-core"))
specs = extend(specs, require("plugins.4-dev"))
specs = extend(specs, require("plugins.99-custom"))

return specs