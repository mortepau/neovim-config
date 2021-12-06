local M = {}

vim.cmd('packadd packer.nvim')
local packer = require('packer')
local plugins = require('plugins')

mortepau.plugin_func = mortepau.plugin_func or {}

function M.init()
  if not mortepau.package_manager then
    mortepau.package_manager = require('packer')
  end

  mortepau.package_manager.init()

  -- Reset so it can be sourced multiple times
  mortepau.package_manager.reset()

  -- Load the plugins
  mortepau.package_manager.use(mortepau.plugins)

  -- Create commands to use the package manager
  local command_template = 'command! -nargs=0 %s lua mortepau.package_manager.%s()<Cr>'
  vim.cmd('command! -nargs=* PackerCompile lua mortepau.package_manager.compile(<q-args>)<Cr>')
  vim.cmd(string.format(command_template, 'PackerInstall', 'install'))
  vim.cmd(string.format(command_template, 'PackerUpdate',  'update'))
  vim.cmd(string.format(command_template, 'PackerSync',    'sync'))
  vim.cmd(string.format(command_template, 'PackerClean',   'clean'))
end

packer.startup(plugins)

return M
