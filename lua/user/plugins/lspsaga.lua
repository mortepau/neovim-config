-- TODO(mortepau): Get rid of lsp-saga, too much bloat
local lazy = require('mortepau.lazy_require')
local saga = lazy.require_deep_call('lspsaga')
saga.init_lsp_saga({
  code_action_keys = {
    quit = { 'q', '<Esc>', '<C-e>', '<C-c>' },
    exec = '<Cr>'
  },
  rename_action_keys = {
    quit = { '<Esc>', '<C-e>', '<C-c>' },
    exec = '<Cr>'
  },
  finder_action_keys = {
    open = '<Cr>',
    vsplit = 'v',
    split = 's',
    -- open = { 'o', '<Cr>' },
    -- vsplit = { 'v', '<C-v>' },
    -- split = { 's', '<C-s>' },
    quit = { '<Esc>', 'q', '<C-c>', '<C-e>' },
    scroll_down = '<C-j>',
    scroll_up = '<C-k>'
  }
})
