-- Entry point for the Neovim configuration files
-- This file is called from init.vim

-- Core functionality
-- Options, Keybindings and Autocommands
local core = require('core')

-- Plugins, completion, lsp, snippet, and statusline
local external = require('external')

-- Useful variables and functions 
local global = require('global')

-- System settings
local system = require('system')

local providers = require('provider')

-- Load all options, mappings and autocommands
core:new(global.mapleader)

-- Define what externals to load
external:new({
  plugin     = global.plugin,
  completion = global.completion,
  snippet    = global.snippet,
  lsp        = global.lsp,
  statusline = global.statusline,
})

-- Preload all external components
external:preload()

-- Set the options, mappings and autocommands
core:start()

-- Set the colorscheme, must be done after runtimepath is updated
core:apply_colorscheme(global.colorscheme)

-- Set tex flavor
vim.g.tex_flavor = global.tex_flavor

-- Do not use PEP8 default settings
vim.g.python_recommended_style = global.python_pep8

-- Load the statusline
external:load_statusline()

-- Load all start packages as they are needed for lsp setup
external:load_plugins()

-- Configure completion
external:configure_completion()

-- Configure LSP, must be done after loading packages
external:configure_lsp()

vim.cmd('command! Spell lua require("utils.functions").toggle_spelling()')

-- TODO: Check out sessions, views
-- TODO: Check out include and includeexpr
-- TODO: Check out formatexpr and formatoptions
-- TODO: Check out makeprg
-- TODO: Providers (netrw, vimball, ++)
-- TODO: RishabhRD/nvim-lsputils: Fix keybindings?
