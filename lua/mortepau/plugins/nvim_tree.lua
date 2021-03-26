vim.nnoremap('<leader>ft', '<cmd>NvimTreeToggle<Cr>')

vim.g.nvim_tree_quit_on_open = true

vim.augroup('NvimTree', {
  { 'Filetype', 'NvimTree', 'lua require("nvim-tree").refresh()', { once = true } }
})
-- require('nvim-tree').refresh()
