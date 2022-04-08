local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

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
vim.cmd('highlight ' .. HighlightFormat('LspDiagnosticsDefaultError', error_group))
vim.cmd('highlight ' .. HighlightFormat('LspDiagnosticsDefaultWarning', warning_group))
vim.cmd('highlight ' .. HighlightFormat('LspDiagnosticsDefaultInformation', information_group))
vim.cmd('highlight ' .. HighlightFormat('LspDiagnosticsDefaultHint', hint_group))
vim.cmd('highlight ' .. HighlightFormat('LspReferenceText', reference_group))
vim.cmd('highlight ' .. HighlightFormat('LspReferenceRead', reference_group))
vim.cmd('highlight ' .. HighlightFormat('LspReferenceWrite', reference_group))

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

  local nnoremap = function(lhs, rhs, opts) vim.keymap.set('n', lhs, rhs, opts) end
  local inoremap = function(lhs, rhs, opts) vim.keymap.set('i', lhs, rhs, opts) end

  -- Definition and declaration
  if capabilities.goto_definition then
    -- vim.nnoremap('gd', '<cmd>lua require("lspsaga.provider").preview_definition()<Cr>', bufsilent)
    nnoremap('gd', vim.lsp.buf.definition, bufsilent)
  end
  if capabilities.declaration then
    nnoremap('gD', vim.lsp.buf.declaration, bufsilent)
  end
  if capabilities.implementation then
    nnoremap('gi', vim.lsp.buf.implementation, bufsilent)
  end
  if capabilities.type_definition then
    nnoremap('g<C-t>', vim.lsp.buf.type_definition, bufsilent)
  end

  -- Information
  if capabilities.hover then
    -- vim.nnoremap('K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<Cr>', bufsilent)
    nnoremap('K', vim.lsp.buf.hover, bufsilent)
  end
  if capabilities.signature_help then
    -- vim.inoremap('<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<Cr>', bufsilent)
    inoremap('<C-k>', vim.lsp.buf.signature_help, bufsilent)
  end
  if capabilities.hover or capabilities.signature_help then
    -- vim.nnoremap('<A-J>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<Cr>', bufsilent)
    -- vim.nnoremap('<A-K>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<Cr>', bufsilent)
  end

  -- Rename
  if capabilities.rename then
    nnoremap('gR', require('user.lsp.actions').rename, bufsilent)
  end

  -- References and symbols
  if capabilities.find_references or capabilities.document_symbol or capabilities.workspace_symbol then
    -- vim.nnoremap('gr', '<cmd>lua require("lspsaga.provider").lsp_finder()<Cr>', bufsilent)
    nnoremap('gr', vim.lsp.buf.references, bufsilent)
  end

  -- Code action
  if capabilities.code_action then
    -- vim.nnoremap('gA', '<cmd>lua require("lspsaga.codeaction").code_action()<Cr>', bufsilent)
    -- vim.vnoremap('gA', ':<C-u>lua require("lspsaga.codeaction").range_code_action()<Cr>', bufsilent)
    nnoremap('gA', vim.lsp.buf.code_action, bufsilent)
    nnoremap('gA', vim.lsp.buf.code_action, bufsilent)
  end

  -- Diagnostics
  -- vim.nnoremap('<leader>dl', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<Cr>', bufsilent)
  -- vim.nnoremap('<leader>dc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<Cr>', bufsilent)
  -- vim.nnoremap('<leader>dn', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<Cr>', bufsilent)
  -- vim.nnoremap('<leader>dN', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<Cr>', bufsilent)
  nnoremap('<leader>dl', vim.diagnostic.open_float, bufsilent)
  nnoremap('<leader>dn', vim.diagnostic.goto_next, bufsilent)
  nnoremap('<leader>dN', vim.diagnostic.goto_prev, bufsilent)

  if capabilities.document_formatting or capabilities.document_range_formatting then
    nnoremap('gF', vim.lsp.buf.formatting, bufsilent)
  end

  if capabilities.call_hierarchy then
    -- vim.cmd([[command! -buffer LspIncomingCalls lua vim.lsp.buf.incoming_calls()]])
    -- vim.cmd([[command! -buffer LspOutgoingCalls lua vim.lsp.buf.outgoing_calls()]])
  end

  if capabilities.document_highlight then
    local group_name = 'LspDocumentHighlight'
    vim.api.nvim_create_augroup(group_name, { clear = false })
    vim.api.nvim_create_autocmd('CursorHold', {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = group_name,
      desc = "Highlight the current document LSP node",
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = group_name,
      desc = "Clear highlights of the current document LSP node",
    })
  end

  vim.cmd([[command! -buffer LspLog execute '<mods> pedit +$' v:lua.vim.lsp.get_log_path()]])
end

-- Active servers
local servers = require('user.lsp.server')

-- Configure servers
for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend('keep',
    config.capabilities or {},
    snippet_capabilities,
    default_capabilities
  )

  pcall(lspconfig[server].setup, config)
end
