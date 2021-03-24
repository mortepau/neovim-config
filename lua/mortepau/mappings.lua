-- Source my rc-file (init.lua or init.vim)
vim.nnoremap('<leader>e', 'luaeval("mortepau.file.source(_A)", $MYVIMRC)')

-- Save
vim.nnoremap('<leader>w', ':write!<Cr>')

-- Rebind redo
vim.nnoremap('<S-u>', '<C-r>')

-- Searching
vim.nnoremap('<Space>', '/')
vim.nnoremap('<leader><Space>', '?')
vim.nnoremap('<leader><Cr>', ':nohlsearch<Cr>')

-- Replace current word under cursor
vim.nnoremap('<C-r>w', ':%s/<C-r><C-w>//g/<Left><Left>')

-- Indentation in visual mode
vim.vnoremap('<', '<gv')
vim.vnoremap('>', '>gv')

-- Move lines
vim.vnoremap('<M-j>', ':m\'>+<Cr>`<my`>mzgv`yo´z')
vim.vnoremap('<M-k>', ':m\'<-2<Cr>`>my`<mzgv`yo`z')

-- Rebind [, ], {, and } for easier access
vim.map('ø', '[')
vim.map('æ', ']')
vim.map('Ø', '{')
vim.map('Æ', '}')
vim.map('øø', '[[')
vim.map('øæ', '[]')
vim.map('æø', '][')
vim.map('ææ', ']]')

-- I use go to first non-blank character more often than first character
vim.noremap('0', '^')
vim.noremap('g0', '0')

-- Show current syntax groups
vim.nnoremap('<leader>hg', ':lua P(mortepau.syntax.stack())<Cr>')
vim.nnoremap('<leader>hw', ':lua mortepau.syntax.highlight_whitespace()<Cr>')

-- Clean excess whitespace
vim.nnoremap('<leader>bw', ':lua mortepau.file.clean_whitespace()')

-- Quickfix commands
vim.nnoremap('<leader>qt', ':lua mortepau.quickfix.toggle()<Cr>', { silent = true })
vim.nnoremap('<leader>qe', ':lua mortepau.quickfix.empty()<Cr>', { silent = true })
vim.nnoremap('<leader>qd', ':lua mortepau.quickfix.diagnostics()<Cr>', { silent = true })
