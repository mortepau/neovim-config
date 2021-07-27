local lspconfig = require('lspconfig')

-- Handlers
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- Enable signs
    signs = true,
    -- Disable virtual text
    virtual_text = true,
    -- Enable underline diagnostics
    underline = true,
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

-- Add highlight groups
local error_group       = { color = { guifg = '#fc514e' }, attribute = {} }
local warning_group     = { color = { guifg = '#e3d18a' }, attribute = {} }
local information_group = { color = { guifg = '#c3ccdc' }, attribute = {} }
local hint_group        = { color = { guifg = '#82aaff' }, attribute = {} }
local reference_group   = { color = { guibg = '#244d6c' }, attribute = {} }
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('LspDiagnosticsDefaultError', error_group))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('LspDiagnosticsDefaultWarning', warning_group))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('LspDiagnosticsDefaultInformation', information_group))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('LspDiagnosticsDefaultHint', hint_group))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('LspReferenceText', reference_group))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('LspReferenceRead', reference_group))
vim.cmd('highlight ' .. mortepau.syntax.format_highlight('LspReferenceWrite', reference_group))

-- Modify the signs shown in the column
-- vim.fn.sign_define('LspDiagnosticsSignError', {
--   text = '', -- uf05e
--   texthl = 'LspDiagnosticsDefaultError',
-- })
-- vim.fn.sign_define('LspDiagnosticsSignWarning', {
--   text = '', -- uf071
--   texthl = 'LspDiagnosticsDefaultWarning',
-- })
-- vim.fn.sign_define('LspDiagnosticsSignInformation', {
--   text = '', -- uf12a
--   texthl = 'LspDiagnosticsDefaultInformation',
-- })
-- vim.fn.sign_define('LspDiagnosticsSignHint', {
--   text = '', -- uf00c
--   texthl = 'LspDiagnosticsDefaultHint',
-- })

-- Attach function
local on_attach = function(client, bufnr)
  -- Find the server's capabilities
  local capabilities = client.resolved_capabilities

  local bufsilent = { silent = true, buffer = bufnr }

  -- Definition and declaration
  if capabilities.goto_definition then
    vim.nnoremap('gd', '<cmd>lua require("lspsaga.provider").preview_definition()<Cr>', bufsilent)
  end
  if capabilities.declaration then
    vim.nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<Cr>', bufsilent)
  end
  if capabilities.implementation then
    vim.nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<Cr>', bufsilent)
  end
  if capabilities.type_definition then
    vim.nnoremap('g<C-t>', '<cmd>lua vim.lsp.buf.type_definition()<Cr>', bufsilent)
  end

  -- Information
  if capabilities.hover then
    vim.nnoremap('K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<Cr>', bufsilent)
  end
  if capabilities.signature_help then
    vim.inoremap('<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<Cr>', bufsilent)
  end
  if capabilities.hover or capabilities.signature_help then
    vim.nnoremap('<A-J>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<Cr>', bufsilent)
    vim.nnoremap('<A-K>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<Cr>', bufsilent)
  end

  -- Rename
  if capabilities.rename then
    vim.nnoremap('gR', require('mortepau.lsp.actions').rename, bufsilent)
  end

  -- References and symbols
  if capabilities.find_references or capabilities.document_symbol or capabilities.workspace_symbol then
    vim.nnoremap('gr', '<cmd>lua require("lspsaga.provider").lsp_finder()<Cr>', bufsilent)
  end

  -- Code action
  if capabilities.code_action then
    vim.nnoremap('gA', '<cmd>lua require("lspsaga.codeaction").code_action()<Cr>', bufsilent)
    vim.vnoremap('gA', ':<C-u>lua require("lspsaga.codeaction").range_code_action()<Cr>', bufsilent)
  end

  -- Diagnostics
  vim.nnoremap('<leader>dl', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<Cr>', bufsilent)
  vim.nnoremap('<leader>dc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<Cr>', bufsilent)
  vim.nnoremap('<leader>dn', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<Cr>', bufsilent)
  vim.nnoremap('<leader>dN', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<Cr>', bufsilent)

  if capabilities.document_formatting or capabilities.document_range_formatting then
    vim.nnoremap('gF', '<cmd>lua vim.lsp.buf.formatting()<Cr>', bufsilent)
  end

  if capabilities.call_hierarchy then
    vim.cmd([[command! -buffer LspIncomingCalls lua vim.lsp.buf.incoming_calls()]])
    vim.cmd([[command! -buffer LspOutgoingCalls lua vim.lsp.buf.outgoing_calls()]])
  end

  if capabilities.document_highlight then
    vim.augroup('LspDocumentHighlight', {
      { 'CursorHold', 0, 'lua vim.lsp.buf.document_highlight()' },
      { 'CursorHold', 0, 'lua require("lspsaga.diagnostic").show_cursor_diagnostics()' },
      { 'CursorMoved', 0, 'lua vim.lsp.buf.clear_references()' },
    })
  end

  vim.cmd([[command! -buffer LspLog execute '<mods> pedit +$' v:lua.vim.lsp.get_log_path()]])
end

-- Active servers
local servers = require('mortepau.lsp.server')

-- Configure servers
for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend('keep',
    config.capabilities or {},
    snippet_capabilities,
    default_capabilities
  )

  lspconfig[server].setup(config)
end
