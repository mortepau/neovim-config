-- Entry point for the Neovim configuration files

_G.mortepau = _G.mortepau or {}

-- Set the mapleader early on, so that later configurations use it
vim.g.mapleader = ','

local colorscheme = 'toast'
pcall(vim.cmd, 'colorscheme ' .. colorscheme)

-- Load my personal configuration
require('mortepau')

-- TODO: Check out sessions, views
-- TODO: Check out include and includeexpr
-- TODO: Check out formatexpr and formatoptions
-- TODO: Check out makeprg
-- TODO: Providers (netrw, vimball, ++)
-- TODO: RishabhRD/nvim-lsputils: Fix keybindings?
