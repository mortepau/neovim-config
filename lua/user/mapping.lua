
local noremap = function(lhs, rhs, opts) vim.keymap.set('', lhs, rhs, vim.tbl_extend('keep', { remap = false }, opts or {})) end
local nnoremap = function(lhs, rhs, opts) vim.keymap.set('n', lhs, rhs, vim.tbl_extend('keep', { remap = false }, opts or {})) end
local vnoremap = function(lhs, rhs, opts) vim.keymap.set('v', lhs, rhs, vim.tbl_extend('keep', { remap = false }, opts or {})) end
local cnoremap = function(lhs, rhs, opts) vim.keymap.set('c', lhs, rhs, vim.tbl_extend('keep', { remap = false }, opts or {})) end
local tnoremap = function(lhs, rhs, opts) vim.keymap.set('t', lhs, rhs, vim.tbl_extend('keep', { remap = false }, opts or {})) end
local map = function(lhs, rhs, opts) vim.keymap.set('', lhs, rhs, vim.tbl_extend('keep', { remap = true }, opts or {})) end

-- Source my rc-file (init.lua or init.vim)
nnoremap('<leader>Fe', function() mortepau.file.source(vim.fn.expand('$MYVIMRC')) end, { silent = false })

nnoremap('<leader>Fp', ':execute(":lcd " . expand("%:h"))<CR>:pwd<CR>')

-- Conditional save and force save
nnoremap('<leader>w', ':update<Cr>')
nnoremap('<leader>W', ':write<Cr>')

-- Rebind redo
nnoremap('<S-u>', '<C-r>')

-- Searching
nnoremap('<Space>', '/')
nnoremap('<leader><Space>', '?')
nnoremap('<leader><Cr>', ':nohlsearch<Cr>')

-- Replace current word under cursor
nnoremap('<C-r>w', ':%s/<C-r><C-w>//g/<Left><Left>')

-- Indentation in visual mode
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Terminal exit
tnoremap('<Esc>', '<C-\\><C-n>', { silent = true })

-- Move lines
nnoremap('<M-j>', 'mz:m+<Cr>`z', { silent = true })
nnoremap('<M-k>', 'mz:m-2<Cr>`z', { silent = true })
vnoremap('<M-j>', ':m\'>+<Cr>`<my`>mzgv`yo`z', { silent = true })
vnoremap('<M-k>', ':m\'<-2<Cr>`>my`<mzgv`yo`z', { silent = true })

-- Rebind [, ], {, and } for easier access
map('ø', '[')
map('æ', ']')
map('Ø', '{')
map('Æ', '}')
map('øø', '[[')
map('øæ', '[]')
map('æø', '][')
map('ææ', ']]')

-- I use go to first non-blank character more often than first character
noremap('0', '^')
noremap('g0', '0')

cnoremap('<Tab>', 'getcmdtype() =~ "[/?]" ? "<C-g>" : "<C-z>"', { expr = true })
cnoremap('<S-Tab>', 'getcmdtype() =~ "[/?]" ? "<C-t>" : "<S-Tab>"', { expr = true })

-- Show current syntax groups
nnoremap('<leader>hg', function()
  if vim.opt_local.syntax:get() == '' then
    vim.cmd('TSHighlightCapturesUnderCursor')
    return
  end

  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local synstack = vim.fn.synstack(line, col+1)
  P(vim.tbl_map(function(v) return vim.fn.synIDattr(v, 'name') end, synstack))
end, { silent = true })

-- Highlight trailing whitespace
nnoremap('<leader>hw', function()
  local group_name = 'HighlightWhitespace'
  vim.api.nvim_create_augroup(group_name, { clear = true })

  if vim.fn.exists('#' .. group_name) == 1 then
    print('Highlighting whitespace disabled.')
  else
    print('Highlighting whitespace enabled.')
    vim.api.nvim_create_autocmd('InsertEnter', { group = group_name, buffer = 0, command = 'match /\\s\\+\\%#\\@<!$/' })
    vim.api.nvim_create_autocmd('InsertLeave', { group = group_name, buffer = 0, command = 'match /\\s\\+$/' })
  end
end, { silent = true })

-- Clean excess whitespace
nnoremap('<leader>Fw', function()
  local cursor = vim.fn.curpos('.')
  local old_query = vim.fn.getreg('/')
  vim.cmd('silent! %s/\\s\\+$//e')
  vim.fn.setpos('.', cursor)
  vim.fn.setreg('/', old_query)
end, { silent = true })

-- Source file based on filename
nnoremap('<leader>Fs', function()
  local filename = vim.fn.expand('%')
  if string.find(filename, '%.vim$') or string.find(filename, '%.lua$') then
    vim.fn.source(filename)
  end
end, { silent = true })

-- Quickfix commands
nnoremap('<leader>qt', function()
  local wins = vim.api.nvim_list_wins()
  local qf_win_exist = #vim.tbl_filter(function(win) return vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'qf' end, wins) > 0
  if qf_win_exist then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end, { silent = true })
nnoremap('<leader>qe', function() vim.fn.setqflist({}) end, { silent = true })
nnoremap('<leader>qn', function() pcall(vim.cmd, 'cnext') end, { silent = true })
nnoremap('<leader>qN', function() pcall(vim.cmd, 'cprev') end, { silent = true })

local function load_diagnostics(bufnr)
  local diagnostics = vim.diagnostic.get(bufnr)
  if #diagnostics == 0 then
    vim.notify("[Diagnostics] No diagnostics found..", vim.log.levels.INFO, {})
    return
  end

  local parsed_diagnostics = {}
  for _, diagnostic in ipairs(diagnostics) do
    table.insert(parsed_diagnostics, {
      bufnr = diagnostic.bufnr,
      filename = vim.fn.expand(vim.api.nvim_buf_get_name(diagnostic.bufnr)),
      lnum = diagnostic.lnum+1,
      col = diagnostic.col+1,
      type = vim.diagnostic.severity[diagnostic.severity]:sub(1, 1),
      text = diagnostic.message,
    })
  end

  vim.fn.setqflist(parsed_diagnostics, 'r')
end

nnoremap('<leader>qd', function() load_diagnostics(vim.api.nvim_get_current_buf())  end, { silent = true })
nnoremap('<leader>qD', load_diagnostics, { silent = true })
