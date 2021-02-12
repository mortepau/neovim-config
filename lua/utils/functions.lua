local M = {}

M.configure_help = function()
  -- Check if the buffer type is 'help'
  if vim.bo.buftype ~= 'help' then return end
  -- Check if the window has already been moved once
  if vim.w.help_win_moved then return end

  local movement = vim.api.nvim_win_get_width(0) > 160 and "L" or "K"
  vim.cmd('wincmd ' .. movement)

  vim.w.help_win_moved = true
end

M.check_back_space = function()
  local col = vim.fn.col('.') - 1
  local line = vim.fn.getline('.')
  return col == 0 or string.sub(line, col, col) == ' '
end

M.toggle_spelling = function()
  -- Useful keybindings
  -- z= : Show list of fixes
  -- zg : Add word to approved list
  -- zw : Remove word from approved list
  -- [s & ]s : Move between misspelled words
  if vim.wo.spell then
    vim.wo.spell = false
  else
    vim.wo.spell = true
    vim.o.spelllang = 'en'
    vim.bo.spelllang = 'en'
  end
end

M.toggle_quickfix = function()
  local qf_open = vim.fn.filter(vim.fn.range(1, vim.fn.winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')

  if #qf_open > 0 then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

M.syn_stack = function()
  if not vim.fn.exists('*synstack') then
    return
  end

  local line = vim.fn.line('.')
  local col = vim.fn.col('.')

  local synstack = vim.fn.synstack(line, col)
  return vim.fn.map(synstack, 'synIDattr(v:val, "name")')
end

M.terminal_escape = function()
  if vim.bo.buftype == 'terminal' and vim.bo.filetype == '' then
    require('utils.map')({ {'t', '<ESC>', '<C-\\><C-n>', { noremap = true, buffer = 0 } } })
  end
end

M.clean_whitespace = function()
  local save_cursor = vim.fn.getpos('.')
  local old_query = vim.fn.getreg('/')
  vim.cmd('silent! %s/\\s\\+$//e')
  vim.fn.setpos('.', save_cursor)
  vim.fn.setreg('/', old_query)
end

M.highlight_whitespace = function()
  require('utils.autocmd')({
    HighlightWhitespace = {
      -- Highlight whitespace except when in insert mode and cursor is directly
      -- after. Source: https://github.com/vivien/vim-linux-coding-style
      { event = 'InsertEnter', pat = '*', cmd = 'match ErrorMsg /\\s\\+\\%#\\@<!$/', },
      { event = 'InsertLeave', pat = '*', cmd = 'match ErrorMsg /\\s\\+$/' }
    }
  })
end


return M
