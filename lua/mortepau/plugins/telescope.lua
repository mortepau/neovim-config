local prefix = '<leader>f'

function mortepau.plugin_func.edit_config()
  require('telescope.builtin').find_files({
    prompt_title = '~ Dotfiles ~',
    shorten_path = false,
    cwd = '~/.config/nvim',

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  })
end

vim.nnoremap(prefix .. 's', '<cmd>Telescope live_grep<Cr>')
vim.nnoremap(prefix .. 'f', '<cmd>Telescope find_files<Cr>')
vim.nnoremap(prefix .. 'F', '<cmd>Telescope git_files<Cr>')
vim.nnoremap(prefix .. 'b', '<cmd>Telescope buffers<Cr>')
vim.nnoremap(prefix .. 'm', '<cmd>Telescope marks<Cr>')
vim.nnoremap(prefix .. 'q', '<cmd>Telescope quickfix<Cr>')
vim.nnoremap(prefix .. 'l', '<cmd>Telescope loclist<Cr>')
vim.nnoremap(prefix .. 'h', '<cmd>Telescope help_tags<Cr>')
vim.nnoremap(prefix .. 'H', '<cmd>Telescope highlights<Cr>')
vim.nnoremap(prefix .. 'k', '<cmd>Telescope keymaps<Cr>')
vim.nnoremap(prefix .. 'gC', '<cmd>Telescope git_commits<Cr>')
vim.nnoremap(prefix .. 'gc', '<cmd>Telescope git_bcommits<Cr>')
vim.nnoremap(prefix .. 'gs', '<cmd>Telescope git_status<Cr>')
vim.nnoremap(prefix .. 'gb', '<cmd>Telescope git_branches<Cr>')
vim.nnoremap(prefix .. 'c', '<cmd>lua mortepau.plugin_func.edit_config()<Cr>')
