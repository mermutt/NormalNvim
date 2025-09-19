local M = {}

-- Current search directory state
M.current_search_dir = nil

-- Set current working directory to a subdirectory
function M.set_cwd_to_subdir()
  local path = vim.fn.input("Enter subdirectory path: ", "", "dir")
  if path ~= "" and vim.fn.isdirectory(path) == 1 then
    vim.cmd("cd " .. path)
    vim.notify("Changed working directory to: " .. path)
  else
    vim.notify("Invalid directory: " .. path, vim.log.levels.WARN)
  end
end

-- Set search directory for telescope and cscope
function M.set_search_dir()
  local path = vim.fn.input("Enter search directory path: ", "", "dir")
  if path ~= "" and vim.fn.isdirectory(path) == 1 then
    M.current_search_dir = path
    vim.notify("Search limited to: " .. path)
  else
    M.current_search_dir = nil
    vim.notify("Invalid directory, search reset to project root", vim.log.levels.WARN)
  end
end

-- Clear search directory limit
function M.clear_search_dir()
  M.current_search_dir = nil
  vim.notify("Search directory limit cleared")
end

-- Get current search directory for telescope
function M.get_search_dir()
  return M.current_search_dir
end

-- Wrapper for telescope live_grep with directory limit
function M.telescope_live_grep()
  local search_dir = M.get_search_dir()
  if search_dir then
    require("telescope.builtin").live_grep({
      cwd = search_dir,
      prompt_title = "Live Grep in: " .. vim.fn.fnamemodify(search_dir, ":t")
    })
  else
    require("telescope.builtin").live_grep()
  end
end

-- Wrapper for telescope find_files with directory limit
function M.telescope_find_files()
  local search_dir = M.get_search_dir()
  if search_dir then
    require("telescope.builtin").find_files({
      cwd = search_dir,
      prompt_title = "Find Files in: " .. vim.fn.fnamemodify(search_dir, ":t")
    })
  else
    require("telescope.builtin").find_files()
  end
end

-- Function to get cscope search arguments with directory limit
function M.get_cscope_args()
  local search_dir = M.get_search_dir()
  if search_dir then
    return {"-d", "-f", search_dir .. "/cscope.out"}
  end
  return {}
end

-- Show current search directory status
function M.show_search_status()
  if M.current_search_dir then
    vim.notify("Search limited to: " .. M.current_search_dir)
  else
    vim.notify("Searching in project root")
  end
end

return M