local lspconfig = require('lspconfig')

-- Handlers
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

-- Capabilities

-- Default capabilities
local default_capabilities = vim.lsp.protocol.make_client_capabilities()

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

-- Highlights
-- Modify the signs shown in the column
vim.fn.sign_define('LspDiagnosticsSignError', {
  text = '', -- uf05e
  texthl = 'LspDiagnosticsDefaultError',
  linehl = '',
  numhl = ''
})
vim.fn.sign_define('LspDiagnosticsSignWarning', {
  text = '', -- uf071
  texthl = 'LspDiagnosticsDefaultWarning',
  linehl = '',
  numhl = ''
})
vim.fn.sign_define('LspDiagnosticsSignInformation', {
  text = '', -- uf12a
  texthl = 'LspDiagnosticsDefaultInformation',
  linehl = '',
  numhl = ''
})
vim.fn.sign_define('LspDiagnosticsSignHint', {
  text = '', -- uf00c
  texthl = 'LspDiagnosticsDefaultHint',
  linehl = '',
  numhl = ''
})

-- Attach function
local on_attach = function(client)
  -- Find the server's capabilities
  local capabilities = client.resolved_capabilities

  local bufsilent = { silent = true, buffer = 0 }

  vim.nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<Cr>', bufsilent)
  vim.nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<Cr>', bufsilent)
  vim.nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<Cr>', bufsilent)
  vim.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<Cr>', bufsilent)
  vim.nnoremap('<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<Cr>', bufsilent)
  vim.nnoremap('g<C-t>', '<cmd>lua vim.lsp.buf.type_definition()<Cr>', bufsilent)
  vim.nnoremap('gR', '<cmd>lua vim.lsp.buf.rename()<Cr>', bufsilent)
  vim.nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<Cr>', bufsilent)
  vim.nnoremap('gA', '<cmd>lua vim.lsp.buf.code_action()<Cr>', bufsilent)

  -- Diagnostics
  vim.nnoremap('<leader>ds', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<Cr>', bufsilent)
  vim.nnoremap('<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<Cr>', bufsilent)
  vim.nnoremap('<leader>dN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<Cr>', bufsilent)
  vim.nnoremap('<leader>do', '<cmd>lua vim.lsp.diagnostic.set_loclist()<Cr>', bufsilent)

  if capabilities.document_formatting then
    vim.nnoremap('gF', '<cmd>lua vim.lsp.buf.formatting()<Cr>', bufsilent)
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

-- Active servers
local servers = require('mortepau.lsp.server')

-- Configure servers
for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend('keep',
    config.capabilities or {},
    default_capabilities,
    snippet_capabilities
  )

  lspconfig[server].setup(config)
end
