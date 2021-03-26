local normal = mortepau.syntax.get_highlight('Normal')
local diffadd = mortepau.syntax.get_highlight('DiffAdd')
diffadd.attribute.inverse = nil
diffadd.color.guibg = normal.guibg
diffadd.color.ctermbg = normal.ctermbg

local diffdelete = mortepau.syntax.get_highlight('DiffDelete')
diffdelete.attribute.inverse = nil
diffdelete.color.guibg = normal.guibg
diffdelete.color.ctermbg = normal.ctermbg

local diffchange = mortepau.syntax.get_highlight('DiffChange')
diffchange.attribute.inverse = nil
diffchange.color.guibg = normal.guibg
diffchange.color.ctermbg = normal.ctermbg

vim.cmd('highlight ' .. mortepau.syntax.format_highlight('GitSignsAdd', diffadd))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('GitSignsDelete', diffdelete))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('GitSignsChange', diffchange))


require('gitsigns').setup({
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    -- Move cursor to next/prev hunk
    ['n <leader>gn'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n <leader>gN'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    -- Hunk management
    ['n <leader>gs'] = '<cmd>lua require("gitsigns").stage_hunk()<Cr>',
    ['n <leader>gu'] = '<cmd>lua require("gitsigns").undo_hunk()<Cr>)',
    ['n <leader>gp'] = '<cmd>lua require("gitsigns").preview_hunk()<Cr>)',

    -- Blame
    ['n <leader>gb'] = '<cmd>lua require("gitsigns").blame_line()<Cr>)',

    -- Text object
    ['x ig'] = ':<C-U>lua require("gitsigns").text_object()<Cr>',
    ['o ig'] = ':<C-U>lua require("gitsigns").text_object()<Cr>',
  }
})
