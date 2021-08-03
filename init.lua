-- Entry point for the Neovim configuration files

-- Create a global table holding my custom functionality
_G.mortepau = _G.mortepau or {}
_G.mortepau.user = vim.env.USER == 'mortepau' and 'mortepau' or 'mopa'
_G.mortepau.git_username = 'mortepau'
_G.mortepau.at_home = vim.env.AT_HOME ~= nil

-- Set the mapleader early on, so that later configurations use it
vim.g.mapleader = ','
-- Disable some builtin plugins
local plugins = {
  ['matchit']    = false,
  ['matchparen'] = false,
  ['gzip']       = true,
  ['netrw']      = true,
  ['tarPlugin']  = true,
  ['tar']        = true,
  ['zipPlugin']  = true,
  ['zip']        = true,
}

for name, disable in pairs(plugins) do
  if disable then
    vim.g['loaded_' .. name] = 1
  end
end

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
local patterns = {
  'TODO',
  'NOTE',
  'FIXME',
  'FIX',
  'HACK',
  'XXX',
  'WARNING',
  'BUG',
}
vim.cmd('command! -nargs=0 QFTodo silent! vimgrep /\\C' .. table.concat(patterns, '\\|') .. '/j ./**')

-- TODO: Check out sessions, views
-- TODO: Check out include and includeexpr
-- TODO: Check out formatexpr and formatoptions
-- TODO: Check out makeprg
-- TODO: vim-dirvish justinmk
