-- Module controlling the behaviour of Neovim.
-- Sets the options, keybindings and autocommands.

-- Load the core modules
local options  = require('core.options')
local mappings = require('core.mappings')
local autocmds = require('core.autocmds')

local Core = {}

-- Create a new core and initialize the configuration tables
function Core:new(leader)
  self.leader = leader
  self.options = options
  self.mappings = mappings
  self.autocmds = autocmds

  self.options:load()
  self.mappings:load()
  self.autocmds:load()
end

-- Set the variables
function Core:start()
  -- Update the mapleader if core's leader differs from the current one
  if vim.g.mapleader ~= self.leader then
    vim.g.mapleader = self.leader
  end
  self.options:set()
  self.mappings:set()
  self.autocmds:set()
end

-- TODO: Patch the colorscheme with the correct colors
function Core:apply_colorscheme(scheme)
  local ok = pcall(vim.cmd, string.format('colorscheme %s', scheme))

  if not ok then
    error('Could not apply colorscheme')
  end
end

return Core
