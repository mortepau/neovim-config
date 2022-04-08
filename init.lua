-- Entry point for the Neovim configuration files

-- TODO(mopa): Check out:
--  hrsh7th/nvim-cmp
--  j-hui/fidget.nvim
--  folke/lsp-trouble.nvim
--  rcarriga/nvim-notify
--  mattn/emmet-vim
--  mfussenegger/nvim-dap
--  rcarriga/nvim-dap-ui
--  theHamsta/nvim-dap-virtual-text
--  JoosepAlviste/nvim-ts-context-commentstring
--  mfussenegger/nvim-ts-hint-textobject
--  romgrk/nvim-treesitter-context
--  TimUntersberger/neogit
--  sindrets/diffview.nvim
--  ThePrimeagen/harpoon
--  ThePrimeagen/git-worktree.nvim
--  Vhyrro/neorg
--  phaazon/hop.nvim
--  kevinhwang91/nvim-hlslens
--  BlackCauldron7/surround.nvim
--  ray-x/lsp_signature.nvim
--  weilbith/nvim-code-action-menu
--  chentau/marks.nvim
--  tversteeg/register.nvim
--  goolord/alpha-nvim
--  comment plugin
--  kevinhwang91/nvim-bqf
--  ggandor/lightspeed.nvim
--  windwp/nvim-autopairs
--  nacro90/numb.nvim
--  mhartington/formatter.nvim lukas-reineke
--  rmagatti/auto-session
--  luukvbaal/stabilize.nvim
--  vim-dirvish justinmk

-- TODO: Check out sessions, views
-- TODO: Check out include and includeexpr
-- TODO: Check out formatexpr and formatoptions
-- TODO: Check out makeprg

-- Create a global table holding my custom functionality
_G.user = _G.user or {
  os_username = vim.env.USER,
  git_username = 'mortepau',
  at_home = vim.env.USER == 'mortepau',
  colorscheme = 'tokyonight',
}

-- Set the mapleader early on, so that later configurations use it
vim.g.mapleader = ','

-- Load impatient before any other plugins
pcall(require, 'impatient')

-- Bootstrap packer.nvim
local bootstrap = require('bootstrap')

-- Load my config
require('user')

-- Only require the plugins if packer.nvim is installed
if bootstrap.installed then
  local packer = require('packer')
  local plugins = require('plugins')

  packer.startup(function(use)
    use(plugins)

    if bootstrap.sync then
      packer.sync()
    end
  end)
end

if bootstrap.installed then
  require('user.lsp')
end

-- TODO: Move this to a better place
local patterns = { 'TODO', 'NOTE', 'FIXME', 'FIX', 'HACK', 'XXX', 'WARNING', 'BUG' }
vim.cmd('command! -nargs=0 QFTodo silent! vimgrep /\\C' .. table.concat(patterns, '\\|') .. '/j ./**')
