local api = vim.api
local wo = api.nvim_win_set_option
local bo = api.nvim_buf_set_option

local M = {}

function M.set(key, value)
  -- Try to set it as window-local option, catch potential errors
  pcall(wo, api.nvim_get_current_win(), key, value)
  -- Try to set it as buffer-local option, catch potential errors
  pcall(bo, api.nvim_get_current_buf(), key, value)
  -- Set it globally, is needed
  vim.api.nvim_set_option(key, value)
end

function M.setlocal(key, value)
  pcall(bo, api.nvim_get_current_buf(), key, value)
  pcall(wo, api.nvim_get_current_win(), key, value)
end

return M
