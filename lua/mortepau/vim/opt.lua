local M = {}

--[[
-- set {option}? - Show value of option
-- set {option} - Toggle options: set, switch it on
--                Number option: show value
--                String option: show value
-- set no{option} - Toggle option: Reset, switch it off
-- set {option}! or set inv{option} - Toggle option: Invert value
-- set {option}& - Reset option to its default value
--]]
function M.set(key, value)
  pcall(vim.api.nvim_win_set_option, vim.api.nvim_get_current_win(), key, value)
  pcall(vim.api.nvim_buf_set_option, vim.api.nvim_get_current_buf(), key, value)
  vim.api.nvim_set_option(key, value)
end

function M.setlocal(key, value)
  pcall(vim.api.nvim_win_set_option, vim.api.nvim_get_current_win(), key, value)
  pcall(vim.api.nvim_buf_set_option, vim.api.nvim_get_current_buf(), key, value)
end

return M
