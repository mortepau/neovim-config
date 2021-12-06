-- Entry point for the Neovim configuration files

-- Create a global table holding my custom functionality
_G.mortepau = _G.mortepau or {
  user = vim.env.USER,
  git_username = 'mortepau',
  at_home = vim.env.AT_HOME ~= nil,
  colorscheme = 'tokyonight',
  plugin_func = {},
}

-- Set the mapleader early on, so that later configurations use it
vim.g.mapleader = ','

-- Bootstrap the package manager
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd('packadd packer.nvim')
end

-- Disable some builtin plugins
-- Currently not disabled: matchit, matchparen
vim.g.loaded_gzip      = true
vim.g.loaded_netrw     = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_tar       = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_zip       = true

-- Disable or enable remote-plugins
local remotes = {
  python      = false,
  python3     = false,
  ruby        = false,
  perl        = false,
  node        = false,
}

for name, value in pairs(remotes) do
  if type(value) == 'string' then
    vim.g[name .. 'host_prog'] = value
  elseif not value then
    vim.g['loaded_' .. name .. '_provider'] = 0
  end
end

-- Load my personal configuration
require('mortepau')

mortepau.colorscheme = 'tokyonight'

-- TODO: Move this to a better place
local patterns = { 'TODO', 'NOTE', 'FIXME', 'FIX', 'HACK', 'XXX', 'WARN', 'BUG' }
vim.cmd('command! -nargs=0 QFTodo silent! vimgrep /\\C' .. table.concat(patterns, '\\|') .. '/j ./**')

-- TODO: Check out sessions, views
-- TODO: Check out include and includeexpr
-- TODO: Check out makeprg
