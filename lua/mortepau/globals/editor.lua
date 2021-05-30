mortepau.editor = mortepau.editor or {}

function mortepau.editor.check_backspace()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()

  return col == 0 or string.sub(line, col, col) == ' '
end

function mortepau.editor.replace_termcodes(string)
  return vim.api.nvim_replace_termcodes(string, true, true, true)
end

function mortepau.editor.spell()
  if vim.api.nvim_win_get_option(0, 'spell') then
    vim.opt.spell = false
    print('Spelling disabled')
  else
    vim.opt.spell = true
    vim.opt.spelllang = 'en'
    print('Spelling enabled, spelllang is set to "en"')
  end
end

mortepau.editor.completion_next = function()
  local t = mortepau.editor.replace_termcodes
  if vim.fn.pumvisible() == 1 then
    return t('<C-n>')
  elseif mortepau.plugin_func.snippet_available_forward() then
    return t(mortepau.plugin_func.snippet_jump_next())
  elseif mortepau.editor.check_backspace() then
    return t('<Tab>')
  else
    return mortepau.plugin_func.open_completion_menu()
  end
end

mortepau.editor.completion_prev = function()
  local t = mortepau.editor.replace_termcodes
  if vim.fn.pumvisible() == 1 then
    return t('<C-p>')
  elseif mortepau.plugin_func.snippet_available_backward() then
    return t(mortepau.plugin_func.snippet_jump_prev())
  else
    return t('<S-Tab>')
  end
end

