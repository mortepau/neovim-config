local system = require('system')

local Global = {}

function Global:load()
  -- Snippet provider
  self.snippet = {
    provider = 'UltiSnips',
    keys = {
      next_entry = '<Tab>',
      prev_entry = '<S-Tab>',
      confirm = '<CR>'
    }
  }

  -- Completion provider
  self.completion = {
    provider = 'completion-nvim',
    keys = {
      next_entry = '<Tab>',
      prev_entry = '<S-Tab>',
      confirm = '<CR>',
      open = '<C-Space>',
    }
  }

  -- LSP provider
  self.lsp = {
    provider = 'builtin',
    keys = {
      diagnostics_open = '<Leader>do',
      diagnostics_next = '<Leader>dn',
      diagnostics_prev = '<Leader>dp',
    }
  }

  -- Plugin manager
  self.plugin = {
    manager = 'packer.nvim'
  }

  -- Statusline provider
  self.statusline = {
    provider = 'lightline'
  }

  -- Mapleader to use for mappings
  self.mapleader = ','

  -- Prioritized list of colorschemes
  self.colorschemes = {
    'gruvbox8_hard',
    'toast',
    'gruvbox',
    'moonfly',
    'nightfly',
    'iceberg'
  }

  -- Current colorscheme
  self.colorscheme = nil

  -- Latex flavor
  self.tex_flavor = 'latex'

  -- Use python PEP8 style recommendations
  self.python_pep8 = true
end

function Global:set_colorscheme()
  for _, colorscheme in ipairs(self.colorschemes) do
    local path = 'colors' .. system.path_separator .. colorscheme .. '.vim'
    if vim.fn.globpath(vim.o.runtimepath, path) then
      self.colorscheme = colorscheme
      return
    end
  end
  self.colorscheme = 'default'
end

Global:load()
Global:set_colorscheme()

return Global
