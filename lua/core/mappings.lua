local mappings = {}

function mappings:load()
  self.mappings = {
    -- Source init.vim
    {'n', '<leader>e',       ':so $MYVIMRC<CR>',              { noremap = true } },

    -- Save
    {'n', '<leader>w',       ':w!<CR>',                       { noremap = true } },

    -- Rebind redo
    {'n', '<S-u>',           '<C-r>',                         { noremap = true } },

    -- Searching
    {'n', '<SPACE>',         '/',                             { noremap = true } },
    {'n', '<leader><SPACE>', '?',                             { noremap = true } },
    {'n', '<leader><CR>',    ':nohlsearch<CR>',               { noremap = true } },

    -- Replace current word under cursor
    {'n', '<C-r>w',          ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true } },

    {'n', '<leader>hg',      '<cmd>lua print(vim.inspect(require(\'utils.functions\').syn_stack()))<CR>', { noremap = true } },

    -- Move line
    {'n', '<M-j>',           'mz:m+<CR>`z',                   { noremap = true, silent = true } },
    {'n', '<M-k>',           'mz:m-2<CR>`z',                  { noremap = true, silent = true } },

    -- Quickfix window
    {'n', '<leader>qt', ':lua require(\'utils.functions\').toggle_quickfix()<CR>', { noremap = true, silent = true } },

    {'v', '<M-j>',           ':m\'>+<CR>`<my`>mzgv`yo`z',     { noremap = true } },
    {'v', '<M-k>',           ':m\'<-2<CR>`>my`<mzgv`yo`z',    { noremap = true } },

    -- Indent line
    {'v', '<',              '<gv',                            { noremap = true } },
    {'v', '>',              '>gv',                            { noremap = true } },

    -- Navigation
    {'',  'ø',               '[',                             {} },
    {'',  'æ',               ']',                             {} },
    {'',  'Ø',               '{',                             {} },
    {'',  'Æ',               '}',                             {} },
    {'',  'øø',              '[[',                            {} },
    {'',  'øæ',              '[]',                            {} },
    {'',  'æø',              '][',                            {} },
    {'',  'ææ',              ']]',                            {} },

    {'',  '0',               '^',                             {} },
  }
end

function mappings:set()
  local map = require('utils.map')
  map(self.mappings)
end

mappings:load()

return mappings
