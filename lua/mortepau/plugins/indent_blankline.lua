vim.g.indent_blankline_char = '│'

vim.g.indent_blankline_show_first_indent_level = false

vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.g.indent_blankline_filetype_exclude = { }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }

-- Workaround for removing cursorline trail
vim.opt.colorcolumn = '9999'
