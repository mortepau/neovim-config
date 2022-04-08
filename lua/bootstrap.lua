-- Bootstrap by installing packer.nvim and install the plugins

local ok, _ = pcall(vim.cmd, "packadd packer.nvim")

-- If we already have packer.nvim installed, return early
if ok then
  return { installed = true, sync = false }
end

-- Check if we actually want to install packer
if vim.fn.input('Download packer.nvim from GitHub? (y to confirm): ') ~= 'y' then
  return { installed = false, sync = false }
end

local path_separator = jit.os == 'Windows' and '\\' or '/'
local directory = table.concat({vim.fn.stdpath('data'), 'site', 'pack', 'packer', 'opt'}, path_separator)
vim.fn.mkdir(directory, 'p')

print('Downloading packer.nvim')
local out = vim.fn.system(string.format(
  'git clone %s %s',
  'https://github.com/wbthomason/packer.nvim',
  directory .. path_separator .. 'packer.nvim'
))

print(out)

vim.cmd('packadd packer.nvim')

return { installed = true, sync = true }
