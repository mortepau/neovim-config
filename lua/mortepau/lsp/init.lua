local lspconfig = require('lspconfig')

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable signs
    signs = true,
    -- Disable virtual text
    virtual_text = false,
    -- Disable underline diagnostics
    underline = false,
    -- Do not update in insert mode
    update_in_insert = false,
  }
)

-- Default capabilities
local default_capabilities = vim.lsp.protocol.make_client_capabilities()
default_capabilities.textDocument.completion.dynamicRegistration = true

-- Allow for the server to send snippets
local snippet_capabilities = {
  textDocument = {
    completion = {
      completionItem = {
        snippetSupport = true
      }
    }
  }
}

local on_attach = function(client)
  -- Find the server's capabilities
  local capabilities = client.resolved_capabilities

  local bufsilent = { silent = true, buffer = 0 }

  vim.nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<Cr>', bufsilent)
  vim.nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<Cr>', bufsilent)
  vim.nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<Cr>', bufsilent)
  vim.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<Cr>', bufsilent)
  vim.nnoremap('<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<Cr>', bufsilent)
  vim.nnoremap('gTD', '<cmd>lua vim.lsp.buf.type_definition()<Cr>', bufsilent)
  vim.nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<Cr>', bufsilent)
  vim.nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<Cr>', bufsilent)
  vim.nnoremap('gA', '<cmd>lua vim.lsp.buf.code_action()<Cr>', bufsilent)
  vim.nnoremap('<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<Cr>', bufsilent)

  if capabilities.document_formatting then
    vim.nnoremap('<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<Cr>', bufsilent)
  end

  if capabilities.document_highlight then
    vim.augroup('LspDocumentHighlight', {
      { 'CursorHold', 0, 'lua vim.lsp.buf.document_highlight()' },
      { 'CursorHold', 0, 'lua vim.lsp.diagnostic.show_line_diagnostics()' },
      { 'CursorMoved', 0, 'lua vim.lsp.buf.clear_references()' },
    })
  end

  -- Enable omnifunc completion
  -- vim.setlocal('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local servers = {}

-- Bash
servers.bashls = require('mortepau.lsp.bashls')

-- Elixir
servers.elixirls = require('mortepau.lsp.elixirls')

-- C, C++
servers.clangd = require('mortepau.lsp.clangd')

-- Arduino ( arduino/arduino-language-server )
-- servers.arduino = require('mortepau.lsp.arduino')

-- Python
servers.pyright = require('mortepau.lsp.pyright')

-- Lua
servers.sumneko_lua = require('mortepau.lsp.sumneko')

-- Vim
servers.vimls = require('mortepau.lsp.vimls')

-- Rust
servers.rls = require('mortepau.lsp.rustls')

-- Typescript
servers.tsserver = require('mortepau.lsp.tsserver')

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend('keep',
    config.capabilities or {},
    -- default_capabilities,
    snippet_capabilities
  )

  lspconfig[server].setup(config)
end
