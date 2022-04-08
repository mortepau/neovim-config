local function augroup(name, autocmds)
  vim.api.nvim_create_augroup(name, { clear = true })
  for _, autocmd in ipairs(autocmds) do
    local event = autocmd.event
    autocmd.event = nil
    vim.api.nvim_create_autocmd(event, autocmd)
  end
end

-- Use cursorline when not in insert mode
augroup('CursorLinetoggle', {
  { event = 'InsertEnter', command = 'set nocursorline', pattern = '*', desc = 'Remove cursorline in insert mode' },
  { event = 'InsertLeave', command = 'set cursorline', pattern = '*', desc = 'Add cursorline outside of insert mode' },
})
-- vim.augroup('CursorLineToggle', {
--   { 'InsertEnter', '*', 'set nocursorline' },
--   { 'InsertLeave', '*', 'set cursorline' },
-- })

-- Return to lat edit position when opening files
augroup('FindPosition', {
  {
    event = 'BufReadPost',
    command = 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | execute "normal! g\'\\"" | endif',
    pattern = '*',
    desc = 'Go to the last position when opening a buffer'
  }
})
-- vim.augroup('FindPosition', {
--   'BufReadPost', '*', 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | execute "normal! g\'\\"" | endif'
-- })

-- Force checktime when focusing or entering buffer
augroup('ManualChecktime', {
  {
    event = { 'FocusGained', 'BufEnter' },
    command = 'if getcmdwintype() == "" | checktime | endif',
    pattern = '*',
    desc = 'Update all buffers if they are modified externally'
  }
})
-- vim.augroup('ManualChecktime', {
--   {'FocusGained', 'BufEnter'}, '*', 'if getcmdwintype() == "" | checktime | endif'
-- })

-- Highlight yanked text
augroup('YankHighlight', {
  {
    event = 'TextYankPost',
    callback = function() vim.highlight.on_yank({ on_visual = false, higroup = 'IncSearch', timeout = 500 }) end,
    pattern = '*',
    desc = 'Highlight the yanked region'
  }
})
-- vim.augroup('YankHighlight', {
--   'TextYankPost', '*', 'silent! lua vim.highlight.on_yank({ on_visual = false, higroup = "IncSearch", timeout = 500 })'
-- })

-- Configure based on buftype, separate autocmd for terminal buffer as a workaround
-- augroup('ConfigureBufType', {
--   {
--     event = 'BufWinEnter',
--     callback = function() mortepau.buftype.configure(vim.fn.expand('<abuf>')) end,
--     pattern = '*',
--     desc = 'Configure the buffer based on the buffer type'
--   },
--   {
--     event = 'TermOpen',
--     callback = function() mortepau.buftype.configure_terminal(vim.fn.expand('<abuf>')) end,
--     pattern = '*',
--     desc = 'Configure the buffer when it is a terminal buffer'
--   }
-- })
-- vim.augroup('ConfigureBuftype', {
--   { 'BufWinEnter', '*', 'call luaeval("mortepau.buftype.configure(tonumber(_A))", expand("<abuf>"))' },
--   { 'TermOpen', '*', 'call luaeval("mortepau.buftype.configure_terminal(tonumber(_A))", expand("<abuf>"))' },
-- })

augroup('AutoCompile', {
  {
    event = 'BufWritePost',
    command = 'source <afile> | PackerCompile',
    pattern = 'plugins.lua',
    desc = 'Source and recompile the plugin file'
  }
})
-- vim.augroup('AutoCompile', {
--   { 'BufWritePost', 'plugins.lua', 'source <afile> | PackerCompile' }
-- })
