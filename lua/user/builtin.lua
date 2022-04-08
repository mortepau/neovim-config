-- Disable some builtin plugins
-- vim.g.loaded_matchit = false
-- vim.g.loaded_matchparen = false
vim.g.loaded_gzip = true
vim.g.loaded_netrw = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_tar = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_zip = true

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
