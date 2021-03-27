mortepau.buftype = mortepau.buftype or {}

function mortepau.buftype.configure(buf)
  local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')

  if buftype == 'terminal' then
    mortepau.buftype.configure_terminal(buf)
  elseif buftype == 'help' then
    mortepau.buftype.configure_help(buf)
  elseif buftype == 'quickfix' then
    mortepau.buftype.configure_quickfix(buf)
  end
end

function mortepau.buftype.configure_terminal(buf)
  -- Only apply these configurations to terminal buffers without filetype
  if vim.api.nvim_buf_get_option(buf, 'filetype') ~= '' then return end

  vim.tnoremap('<Esc>', '<C-\\><C-N>', { buffer = buf })
  vim.tnoremap('<C-r>', '\'<C-\\><C-N>"\'.nr2char(getchar())."pi"', { buffer = buf, expr= true })
end

function mortepau.buftype.configure_help(buf)
  -- Position the window
  local movement = vim.api.nvim_win_get_width(0) > 160 and 'L' or 'K'
  vim.cmd('wincmd ' .. movement)

  -- Add keymaps
  vim.nnoremap('<Esc>', '<cmd>q<Cr>', { buffer = buf })
  vim.nnoremap('q', '<cmd>q<Cr>', { buffer = buf })

  -- Set local options
  vim.setlocal('number', true)
  vim.setlocal('relativenumber', false)

  -- Add augroup
  vim.augroup('HelpCursorLine', {
    { 'BufEnter', buf, 'setlocal cursorline' },
    { 'BufLeave', buf, 'setlocal nocursorline' },
  })
end

function mortepau.buftype.configure_quickfix(buf)
end
