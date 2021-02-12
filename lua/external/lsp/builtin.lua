local system = require('system')
local autocmd = require('utils.autocmd')
local map = require('utils.map')

local Lsp = {}

function Lsp:init(opts)
  if not opts.keys then
    opts.keys = {}
  end

  self.keys = {
    diagnostics_open = opts.keys.diagnostics_open or '<Leader>do',
    diagnostics_next = opts.keys.diagnostics_next or '<Leader>dn',
    diagnostics_prev = opts.keys.diagnostics_prev or '<Leader>dp',
  }
end

function Lsp:preload()
  return
end

function Lsp:load()
  vim.cmd('packadd nvim-lspconfig')
  vim.cmd('packadd nvim-lsputils')
  vim.cmd('packadd popfix')
  vim.cmd('packadd nlua.nvim')
  require('lsp')
end

function Lsp:postload()
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

  -- Diagnostic bindings
  map({
    { 'n', self.keys.diagnostics_next, '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',   { noremap = true, silent = true } },
    { 'n', self.keys.diagnostics_prev, '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',   { noremap = true, silent = true } },
    { 'n', self.keys.diagnostics_open, '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true, silent = true } },
  })
  autocmd({
    -- Display diagnostic on line
    LspDiagnostics = {
      { event = 'CursorHold', pat = '*', cmd = 'lua vim.lsp.diagnostic.show_line_diagnostics()' }
    }
  })
end

return Lsp
