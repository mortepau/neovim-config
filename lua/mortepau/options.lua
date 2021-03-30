local ps = jit.os == 'Windows' and '\\' or '/'

-- System
vim.set('encoding', 'UTF-8')
vim.set('fileformats', 'unix,dos,mac')
-- Colors
vim.set('termguicolors', true)
vim.set('background', 'dark')

-- Buffer
vim.set('hidden', true)
vim.set('switchbuf', 'useopen,usetab,vsplit')

-- Statusline
vim.set('showmode', false)
vim.set('showtabline', 1)
vim.set('cmdheight', 2)
vim.set('laststatus', 2)
vim.set('ruler', true)
vim.set('shortmess', 'filmnrxoOtTcF')

-- Scrolling
vim.set('sidescroll', 1)

-- Backspacing
vim.set('backspace', 'indent,eol,start')

-- Formatting (indent)
vim.set('shiftround', true)
vim.set('smarttab', true)

-- Formatting (wrap)
vim.set('showbreak', '↳ ')
vim.set('whichwrap', '<,>,h,l')

-- Formatting (fold)
vim.set('foldlevelstart', 99)

-- Searching
vim.set('ignorecase', true)
vim.set('smartcase', true)
vim.set('incsearch', true)
vim.set('hlsearch', false)
vim.set('magic', true)
vim.set('inccommand','split')
-- TODO: Set path
vim.set('path', '.,/usr/include,,~/.config/**')

-- Menu
vim.set('wildmenu', true)
vim.set('wildmode', 'longest,full')
vim.set('wildignore', '*.o,*~,*.pyc,.git,.hg,.svn,*.out,*.jpg,*.png,*.jpeg,*.gif,*.DS_Store,**' .. ps .. 'node_modules' .. ps .. '**')
vim.set('wildcharm', vim.fn.char2nr('')) -- Integer equivalent to <C-z>

-- History
vim.set('history', 500)
vim.set('undodir', vim.fn.stdpath('data') .. ps .. 'tmp_dirs' .. ps .. 'undodir')
vim.set('backup', false)
vim.set('writebackup', false)

-- Updating
vim.set('lazyredraw', true)
vim.set('redrawtime', 1500)
vim.set('updatetime', 300)
vim.set('autoread', true)

-- Cursor
vim.set('mouse', 'nv')

-- Error
vim.set('belloff', 'all')
vim.set('errorbells', false)
vim.set('visualbell', false)

-- Completion
vim.set('completeopt', 'menuone,noinsert,noselect')
vim.set('complete', '.,w,b,k,i')
vim.set('showmatch', true)
vim.set('matchtime', 5)
vim.set('pumwidth', 7)
vim.set('pumheight', 40)

-- Window
vim.set('equalalways', false)
vim.set('splitbelow', true)
vim.set('splitright', true)

-- File browser
-- bsdir = 'current'

-- Grep
-- TODO: Should be set based on what provider we have
-- grepprg = provider.tools.grepper.prog('', nil, '')
-- grepformat = '%f:%l:%c:%m',

-- Column
vim.set('signcolumn', 'yes:2')
vim.set('number', true)

-- Scrolling
vim.set('scrolloff', 7)
vim.set('sidescrolloff', 3)

-- Display
vim.set('list', true)
vim.set('listchars', "tab:»·,nbsp:+,trail:·,extends:→,precedes:←")
vim.set('concealcursor', 'niv')
vim.set('conceallevel', 2)
vim.set('cursorline', true)

-- Formatting (indent)
vim.set('linebreak', true)
vim.set('wrap', false)

-- Formatting (fold)
vim.set('foldenable', true)
vim.set('foldmethod', 'indent')

-- History
vim.set('swapfile', false)
vim.set('undofile', true)

-- Spelling
vim.set('spellfile', vim.fn.stdpath('data') .. ps .. 'spell' .. ps .. 'utf-8.add')

-- Formatting
-- Fix this, need to actually not use 'o'
vim.set('formatoptions', 'crq2jl')

-- Formatting (indent)
vim.set('shiftwidth', 4)
vim.set('tabstop', 4)
vim.set('softtabstop', 4)
vim.set('autoindent', true)
vim.set('smartindent', true)
vim.set('expandtab', true)

-- Formatting (wrap)
vim.set('textwidth', 80)
