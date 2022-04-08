local M = {}
local config = require('user.lsp.actions.config')
local util = require('user.lsp.actions.util')

local function rename_closure(buf, win, parent_buf, params)
  local closure = function(text)
    if text and #text > 0 then
      params.newName = text
      vim.lsp.buf_request(parent_buf, 'textDocument/rename', params, nil)
    end

    util.close_float(buf, win)
  end
  return closure
end

function M.update(buf, win)
  if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_win_is_valid(win) then
    return
  end

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local linelen = vim.fn.strdisplaywidth(lines[#lines])
  local win_config = vim.api.nvim_win_get_config(win)
  local shift = (win_config.width < linelen + 2) and 1 or -1
  local new_win_width = math.max(
    win_config.width + shift,
    config.get('rename_prompt_width')
  )
  vim.api.nvim_win_set_config(win, { width = new_win_width })
end

function M.rename()
  local parent_buf = vim.api.nvim_get_current_buf()
  local params = vim.lsp.util.make_position_params()
  local prompt_text = string.format(
    config.get('rename_prompt_text'),
    vim.fn.expand('<cword>')
  )
  local prompt_width = config.get('rename_prompt_width')

  if vim.fn.strdisplaywidth(prompt_text) > prompt_width then
    prompt_width = vim.fn.strdisplaywidth(prompt_text) + 3
  end
  local rename_win_config = {
    relative = 'cursor',
    row = 1,
    width = prompt_width,
    border = config.get('rename_prompt_border')
  }
  local prompt_buf, prompt_win = util.new_win(true, rename_win_config)
  util.to_prompt(
    prompt_buf,
    prompt_text,
    rename_closure(prompt_buf, prompt_win, parent_buf, params)
  )
  util.buf_autocmd(prompt_buf, 'LspRename', {
    { 'WinLeave', function() require('user.lsp.actions.util').close_float(prompt_buf, prompt_win) end },
    { 'CursorMovedI', function() require('user.lsp.actions.rename').update(prompt_buf, prompt_win) end },
  })
  local cancel_keys = config.get('rename_cancel_keys')
  if type(cancel_keys) == 'string' then
    cancel_keys = { cancel_keys }
  end
  for _, key in ipairs(cancel_keys) do
    vim.keymap.set('n', key, function() util.close_float(prompt_buf, prompt_win) end, { silent = true, buffer = prompt_buf })
  end
  vim.cmd('startinsert!')
end

return M
