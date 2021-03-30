local servers = {}

local base = 'mortepau.lsp.server.'

servers = {
  arduino = require(base .. 'arduino'),
  bashls = require(base .. 'bashls'),
  clangd = require(base .. 'clangd'),
  elixirls = require(base .. 'elixirls'),
  pyright = require(base .. 'pyright'),
  rls = require(base .. 'rustls'),
  sumneko_lua = require(base .. 'sumneko'),
  tsserver = require(base .. 'tsserver'),
  vimls = require(base .. 'vimls'),
}

return servers
