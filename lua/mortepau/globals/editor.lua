mortepau.editor = mortepau.editor or {}

function mortepau.editor.check_backspace()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()

  return col == 0 or string.sub(line, col, col) == ' '
end

function mortepau.editor.spell()
  if vim.api.nvim_win_get_option(0, 'spell') then
    vim.setlocal('spell', false)
    print('Spelling disabled')
  else
    vim.setlocal('spell', true)
    vim.setlocal('spelllang', 'en')
    print('Spelling enabled, spelllang is set to "en"')
  end
end
