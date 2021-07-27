-- Use relative numbers when inside buffer and not in insert mode
-- vim.augroup('NumberToggle', {
--   { {'BufEnter', 'FocusGained', 'InsertLeave'}, '*', 'if &filetype !=# "help" | set relativenumber | endif' },
--   { {'BufLeave', 'FocusLost', 'InsertEnter'}, '*', 'if &filetype !=# "help" | set norelativenumber | endif' },
-- })

-- Use cursorline when not in insert mode
vim.augroup('CursorLineToggle', {
  { 'InsertEnter', '*', 'set nocursorline' },
  { 'InsertLeave', '*', 'set cursorline' },
})

-- Return to lat edit position when opening files
vim.augroup('FindPosition', {
  'BufReadPost', '*', 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | execute "normal! g\'\\"" | endif'
})

-- Force checktime when focusing or entering buffer
vim.augroup('ManualChecktime', {
  {'FocusGained', 'BufEnter'}, '*', 'if getcmdwintype() == "" | checktime | endif'
})

-- Highlight yanked text
vim.augroup('YankHighlight', {
  'TextYankPost', '*', 'silent! lua vim.highlight.on_yank({ on_visual = false, higroup = "IncSearch", timeout = 500 })'
})

-- Configure based on buftype, separate autocmd for terminal buffer as a workaround
vim.augroup('ConfigureBuftype', {
  { 'BufWinEnter', '*', 'call luaeval("mortepau.buftype.configure(tonumber(_A))", expand("<abuf>"))' },
  { 'TermOpen', '*', 'call luaeval("mortepau.buftype.configure_terminal(tonumber(_A))", expand("<abuf>"))' },
})

vim.augroup('AutoCompile', {
  { 'BufWritePost', '~/.config/nvim/lua/plugins.lua', 'PackerCompile' }
})
