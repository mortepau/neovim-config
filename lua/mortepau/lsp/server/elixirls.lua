--[[
Requirements:
  Elixir
  Erlang
Installation instructions:
  curl -fl0 https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip --output elixir-ls
--]]
local config = {}

config.cmd = { vim.fn.expand('$HOME/src/elixir-ls/language_server.sh') }

config.filetypes = { 'elixir', 'eelixir' }

return config
