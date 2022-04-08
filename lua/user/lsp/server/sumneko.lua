--[[
Requirements:
  ninja
Installation instructions:
  git clone https://github.com/sumneko/lua-language-server
  cd lua-language-server
  git submodule update --init --recursive
  cd 3rd/luamake
  ninja -f ninja/macos.ninja
  cd ../..
  ./3rd/luamake/luamake rebuild
--]]
local path_util = require('lspconfig.util')
local config = {}

local system_name = jit.os == 'OSX' and 'macOS' or 'Linux'
local sumneko_root_path = vim.fn.expand('$HOME/src/lua-language-server')
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

config.cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' }

config.root_dir = function(fname) return path_util.find_git_ancestor(fname) or path_util.path.dirname(fname) end

config.filetypes = { 'lua' }

config.settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      path = vim.tbl_flatten({ 'lua/?.lua', 'lua/?/init.lua', vim.split(package.path, ';') }),
    },
    diagnostics = {
      enable = true,
      globals = { 'vim', 'hs', 'it', 'describe', 'before_each', 'after_each', 't', 'P', 'R', 'Reload', 'user', 'HighlightGet', 'HighlightFormat' },
    },
    workspace = {
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
      maxPreload = 2000,
      preloadFileSize = 150,
    },
    telemetry = {
      enable = false,
    },
  }
}

return require('lua-dev').setup({ lspconfig = config })
