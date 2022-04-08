local M = {}
M.levels = vim.tbl_add_reverse_lookup(vim.deepcopy(vim.log.levels))

local loop = vim.loop

local function capitalize(str)
  local s = str:lower()
  return s:sub(1, 1):upper() .. s:sub(2)
end

---Convert `level` to a valid neovim log level
---@param level string|number @level to convert
---@return string @Converted level value
function M.translate_level(level)
  if not level then
    return vim.log.levels.ERROR
  end

  if type(level) == "number" then
    level = M.levels[level]
  end

  return level
end

function M.create_timer(timeout, callback)
  local timer = loop.new_timer()
  timer:start(timeout, 0, function()
    -- Run the callback if it is a function
    if type(callback) == "function" then
      callback()
    end

    -- Close the timer
    timer:close()
  end)
  return timer
end

function M.create_window(opts)
  local buf = vim.api.nvim_create_buf(false, true)

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = opts.width,
    height = opts.height,
    row = 1,
    col = vim.opt.columns:get() - opts.width - 1,
    focusable = false,
    border = "rounded",
    style = "minimal",
    noautocmd = true,
  })

  return buf, win
end

function M.notify(msg, level, opts)
  if not msg then
    return
  end
  level = M.translate_level(level)
  opts = opts or {}

  msg = vim.split(msg, "\n")
  table.insert(msg, 1, capitalize(level))

  local width = 0
  for _, line in ipairs(msg) do
    if #line > width then
      width = #line
    end
  end

  table.insert(msg, 2, string.rep("─", width))

  local buffer, window = M.create_window({ width = width, height = #msg })
  vim.api.nvim_buf_set_lines(buffer, 0, 0, false, msg)
  M.create_timer(opts.timeout or 1000, vim.schedule_wrap(function()
    if vim.api.nvim_buf_is_valid(buffer) then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
    if vim.api.nvim_win_is_valid(window) then
      vim.api.nvim_win_close(window, true)
    end
  end))
end

vim.notify =  M.notify

return M
