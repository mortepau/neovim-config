-- Update the highlight groups GitSignsAdd, GitSignsDelete, and GitSignsChange
vim.api.nvim_create_augroup('GitSignsColors', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'GitSignsColors',
  pattern = '*',
  callback = function()
    local base = HighlightGet('SignColumn')
    if not base.color.guibg or not base.color.ctermbg then
      base = HighlightGet('Normal')
    end

    local diffadd = HighlightGet('DiffAdd')
    diffadd.attribute.inverse = nil
    diffadd.color.guibg = base.color.guibg
    diffadd.color.ctermbg = base.color.ctermbg

    local diffdelete = HighlightGet('DiffDelete')
    diffdelete.attribute.inverse = nil
    diffdelete.color.guibg = base.color.guibg
    diffdelete.color.ctermbg = base.color.ctermbg

    local diffchange = HighlightGet('DiffChange')
    diffchange.attribute.inverse = nil
    diffchange.color.guibg = base.color.guibg
    diffchange.color.ctermbg = base.color.ctermbg

    vim.cmd('highlight ' .. HighlightFormat('GitSignsAdd', diffadd))
    vim.cmd('highlight ' .. HighlightFormat('GitSignsDelete', diffdelete))
    vim.cmd('highlight ' .. HighlightFormat('GitSignsChange', diffchange))
  end
})


require('gitsigns').setup({
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  sign_priority = 6,
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local map = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map('n', ']h', '&diff ? "]c" : "<cmd>Gitsigns next_hunk<CR>"', { expr = true })
    map('n', '[h', '&diff ? "[c" : "<cmd>Gitsigns prev_hunk<CR>"', { expr = true })

    map({'n', 'v'}, '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>')
    map('n', '<leader>gS', gitsigns.stage_buffer)
    map('n', '<leader>gu', gitsigns.undo_stage_hunk)
    map('n', '<leader>gR', gitsigns.reset_buffer)
    map('n', '<leader>gp', gitsigns.preview_hunk)
    map('n', '<leader>gb', function() gitsigns.blame_line({full = true}) end)
    map('n', '<leader>gB', gitsigns.toggle_current_line_blame)
    map('n', '<leader>gd', gitsigns.diffthis)
    map('n', '<leader>gD', function() gitsigns.diffthis("~") end)

    map({'o', 'x'}, 'ig', ':<C-U>Gitsigns select_hunk<CR>')
  end,
})
