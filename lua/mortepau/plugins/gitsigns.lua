-- Update the highlight groups GitSignsAdd, GitSignsDelete, and GitSignsChange
mortepau.plugin_func.define_gitsign_highlights = function()
  local base = mortepau.syntax.get_highlight('SignColumn')
  if not base.color.guibg or not base.color.ctermbg then
    base = mortepau.syntax.get_highlight('Normal')
  end

  local diffadd = mortepau.syntax.get_highlight('DiffAdd')
  diffadd.attribute.inverse = nil
  diffadd.color.guibg = base.color.guibg
  diffadd.color.ctermbg = base.color.ctermbg

  local diffdelete = mortepau.syntax.get_highlight('DiffDelete')
  diffdelete.attribute.inverse = nil
  diffdelete.color.guibg = base.color.guibg
  diffdelete.color.ctermbg = base.color.ctermbg

  local diffchange = mortepau.syntax.get_highlight('DiffChange')
  diffchange.attribute.inverse = nil
  diffchange.color.guibg = base.color.guibg
  diffchange.color.ctermbg = base.color.ctermbg

  vim.cmd('highlight ' .. mortepau.syntax.format_highlight('GitSignsAdd', diffadd))
  vim.cmd('highlight ' .. mortepau.syntax.format_highlight('GitSignsDelete', diffdelete))
  vim.cmd('highlight ' .. mortepau.syntax.format_highlight('GitSignsChange', diffchange))
end
mortepau.plugin_func.define_gitsign_highlights()

vim.augroup('GitSignsColors', {
  { 'Colorscheme', '*', 'lua mortepau.plugin_func.define_gitsign_highlights()' }
})


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
  },
  sign_priority = 20,
})
