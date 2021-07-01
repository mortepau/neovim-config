local languages = {
  'bash',
  'bibtex',
  'c',
  'cpp',
  'css',
  'elixir',
  'go',
  'html',
  'javascript',
  'json',
  'jsdoc',
  'latex',
  'lua',
  'python',
  'query',
  'regex',
  'rust',
  'tsx',
  'typescript',
  'verilog',
  'yaml',
}

require('nvim-treesitter.configs').setup({
  ensure_installed = languages,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'gni',
      node_decremental = 'gnI',
      scope_incremental = 'gns',
    }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ['cxn'] = '@parameter.inner',
      },
      swap_previous = {
        ['cxN'] = '@parameter.inner',
      }
    }
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { 'CursorHold', 'BufWrite' }
  }
})
