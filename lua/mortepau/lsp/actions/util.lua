local M = {}

function M.default_win_config()
  return {
    relative = 'editor',
    anchor = 'NW',
    width = 1,
    height = 1,
    col = 0,
    row = 0,
    focusable = false,
    style = 'minimal',
    border = 'solid',
    noautocmd = true
  }
end

function M.new_win(enter, win_config)
  local buf = vim.api.nvim_create_buf(false, false)
  local win = vim.api.nvim_open_win(
    buf,
    enter,
    vim.tbl_extend('force', M.default_win_config(), win_config)
  )
  M.buf_set_opts(buf, {
    textwidth = 0,
    wrapmargin = 0,
  })
  M.win_set_opts(win, {
    winhighlight = 'Normal:LspRename,FloatBorder:LspRenameBorder',
    sidescrolloff = 0,
    wrap = false,
    linebreak = false,
  })
  return buf, win
end

function M.buf_autocmd(buf, group, autocmds)
  vim.cmd(string.format('augroup %s', group))
  vim.cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    vim.cmd(string.format('autocmd %s <buffer=%d> %s', autocmd[1], buf, autocmd[2]))
  end
  vim.cmd('augroup END')
end

function M.to_prompt(buf, text, callback)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'prompt')
  vim.fn.prompt_setprompt(buf, text)
  vim.fn.prompt_setcallback(buf, callback)
end

function M.buf_set_opts(buf, opts)
  for opt, value in pairs(opts) do
    vim.api.nvim_buf_set_option(buf, opt, value)
  end
end

function M.win_set_opts(win, opts)
  for opt, value in pairs(opts) do
    vim.api.nvim_win_set_option(win, opt, value)
  end
end

function M.close_float(buf, win)
  if vim.api.nvim_buf_is_valid(buf) then
    vim.api.nvim_buf_delete(buf, { force = true })
  end
  if vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
end

return M
