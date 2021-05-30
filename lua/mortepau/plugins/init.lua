local M = {}

if not mortepau.plugin_func then
	mortepau.plugin_func = {}
end

local path_separator = jit.os == 'Windows' and '\\' or '/'

function M.install()
  local packer_exist = pcall(vim.cmd, 'packadd packer.nvim')

  if packer_exist then
    return
  end

  if vim.fn.input('Download packer.nvim? (y to confirm): ') ~= 'y' then
    return
  end

  local directory = table.concat({vim.fn.stdpath('data'), 'site', 'pack'}, path_separator)
  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. path_separator .. 'packer.nvim'
  ))

  print(out)
  print('Downloading packer.nvim')

  -- Load the newly installed package manager
  vim.cmd('packadd packer.nvim')
end

function M.init()
  -- Load package manager, and install if necessary
  M.install()

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

require('plugins')

return M
