local nvim_lsp       = require('lspconfig')
local lu_code_action = require('lsputil.codeAction')
local lu_locations   = require('lsputil.locations')
local lu_symbols     = require('lsputil.symbols')
local nlua           = require('nlua.lsp.nvim')
local system         = require('system')

vim.lsp.handlers['textDocument/codeAction']     = lu_code_action.code_action_handler
vim.lsp.handlers['textDocument/references']     = lu_locations.references_handler
vim.lsp.handlers['textDocument/definitions']    = lu_locations.definition_handler
vim.lsp.handlers['textDocument/declaration']    = lu_locations.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = lu_locations.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = lu_locations.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = lu_symbols.document_handler
vim.lsp.handlers['workspace/symbol']            = lu_symbols.workspace_handler
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable signs
    signs = true,
    -- Disable virtual text
    virtual_text = false,
    -- Underline diagnostics
    underline = false,
    -- Do not update in insert mode
    update_in_insert = false
  }
)

local custom_on_attach = function(client)
  local map = require('utils.map')
  local autocmd = require('utils.autocmd')

  -- Attach completion and diagnostics
  require('completion').on_attach(client)

  -- Find out what capabilities the server has
  local capabilities = client.resolved_capabilities

  local mappings = {}
  local autocmds = {}

  -- Go through the different capabilities and add mappings/autocmds if
  -- they are resolved for the LSP server

  if capabilities.declaration then
    table.insert(mappings, {
      'n',
      'gd',
      '<cmd>lua vim.lsp.buf.declaration()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.goto_definition then
    table.insert(mappings, {
      'n',
      'gD',
      '<cmd>lua vim.lsp.buf.definition()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.find_references then
    table.insert(mappings, {
      'n',
      'gr',
      '<cmd>lua vim.lsp.buf.references()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.implementation then
    table.insert(mappings, {
      'n',
      'gi',
      '<cmd>lua vim.lsp.buf.implementation()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.type_definition then
    table.insert(mappings, {
      'n',
      'gI',
      '<cmd>lua vim.lsp.buf.type_definition()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.signature_help then
    table.insert(mappings, {
      'n',
      'gK',
      '<cmd>lua vim.lsp.buf.signature_help()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.workspace_symbol then
    table.insert(mappings, {
      'n',
      'gSw',
      '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.document_symbol then
    table.insert(mappings, {
      'n',
      'gSd',
      '<cmd>lua vim.lsp.buf.document_symbol()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.hover then
    table.insert(mappings, {
      'n',
      '<C-k>',
      '<cmd>lua vim.lsp.buf.hover()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })
  end

  if capabilities.document_formatting then
    table.insert(mappings, {
      'n',
      'gSf',
      '<cmd>lua vim.lsp.buf.formatting()<CR>',
      { noremap = true, silent = true, buffer = 0 }
    })

    table.insert(autocmds, {
      event = 'BufWritePre',
      buffer = 0,
      cmd = 'lua vim.lsp.buf_formatting_sync(nil, 1000)' 
    })
  end

  -- Actually add the mappings
  map(mappings)

  -- Autocommands
  if #autocmds > 0 then
    autocmd({
      LspConfiguration = autocmds
    })
  end
end

-- Server configurations

-- Bash
nvim_lsp.bashls.setup({
  on_attach = custom_on_attach
})

-- C, C++
nvim_lsp.clangd.setup({
  on_attach = custom_on_attach
})

-- CSS
nvim_lsp.cssls.setup({
  on_attach = custom_on_attach
})

-- HTML
nvim_lsp.html.setup({
  on_attach = custom_on_attach
})

-- Elixir
nvim_lsp.elixirls.setup({
  on_attach = custom_on_attach
})

-- JSON
nvim_lsp.jsonls.setup({
  on_attach = custom_on_attach
})

-- Python
-- nvim_lsp.pyls_ms.setup({
--   on_attach = custom_on_attach
-- })

-- Lua
local sumneko_root = system.home .. system.path_separator .. 'src' .. system.path_separator .. 'lua-language-server'
local sumneko_binary = sumneko_root .. system.path_separator .. 'bin' .. system.path_separator .. system.system_name .. system.path_separator .. 'lua-language-server'
nlua.setup(nvim_lsp, {
  cmd = { sumneko_binary, '-E', sumneko_root .. system.path_separator .. 'main.lua' },
  on_attach = custom_on_attach
})

-- TypeScript
nvim_lsp.tsserver.setup({
  on_attach = custom_on_attach
})

-- Vim
nvim_lsp.vimls.setup({
  on_attach = custom_on_attach
})
