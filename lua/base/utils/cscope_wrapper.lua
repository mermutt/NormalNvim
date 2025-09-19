local M = {}

local cscope_maps_avail, cscope_maps = pcall(require, "cscope_maps")
local dir_utils_avail, dir_utils = pcall(require, "base.utils.dir_utils")

if not cscope_maps_avail then
  vim.notify("cscope_maps.nvim not available", vim.log.levels.WARN)
  return M
end

-- Original cscope functions
local original_functions = {}

-- Override cscope functions to use directory limit
function M.setup()
  -- Store original functions
  original_functions.cscope_prompt = cscope_maps.cscope_prompt
  
  -- Override cscope_prompt to use directory limit
  cscope_maps.cscope_prompt = function(opts)
    local search_dir = dir_utils_avail and dir_utils.get_search_dir()
    
    if search_dir then
      -- Add directory-specific cscope database
      opts = opts or {}
      opts.cscope_args = opts.cscope_args or {}
      
      -- Use cscope database from the search directory
      table.insert(opts.cscope_args, "-f")
      table.insert(opts.cscope_args, search_dir .. "/cscope.out")
      
      vim.notify("Searching in: " .. search_dir)
    end
    
    return original_functions.cscope_prompt(opts)
  end
  
  -- Setup cscope_maps with original options
  cscope_maps.setup()
end

return M