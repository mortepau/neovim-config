vim.g.indent_blankline_char = '│'

vim.g.indent_blankline_show_first_indent_level = false

vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Workaround for removing cursorline trail
vim.set('colorcolumn', '9999')
