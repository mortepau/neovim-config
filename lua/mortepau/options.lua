local ps = jit.os == 'Windows' and '\\' or '/'

-- System
vim.opt.encoding = 'UTF-8'
vim.opt.fileformats = { 'unix', 'dos', 'mac' }

-- Colors
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Buffer
vim.opt.hidden = true
vim.opt.switchbuf = { 'useopen', 'vsplit', 'uselast' }

-- Statusline
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.shortmess = vim.opt.shortmess + 'mrc'

-- Scrolling
vim.opt.sidescroll = 1

-- Backspacing
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Formatting (indent)
vim.opt.shiftround = true
vim.opt.smarttab = true

-- Formatting (wrap)
vim.opt.showbreak = '↳ '
vim.opt.whichwrap = {
  ['<'] = true,
  ['>'] = true,
  ['h'] = true,
  ['l'] = true,
}

-- Formatting (fold)
vim.opt.foldlevelstart = 99

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.magic = true
vim.opt.inccommand = 'nosplit'
-- TODO: Set path
vim.opt.path = { '.', '~/.config/**' }

-- Menu
vim.opt.wildmenu = true
vim.opt.wildmode = { 'longest', 'full' }
vim.opt.wildignore = {
  '*.o',
  '*~',
  '*.pyc',
  '.git',
  '.hg',
  '.svn',
  '*.out',
  '*.jpg',
  '*.png',
  '*.jpeg',
  '*.gif',
  '*.DS_Store',
  '**' .. ps .. 'node_modules' .. ps .. '**'
}
vim.opt.wildcharm = vim.fn.char2nr('') -- Integer equivalent to <C-z>

-- History
vim.opt.history = 500
vim.opt.undodir = vim.fn.stdpath('data') .. ps .. 'tmp_dirs' .. ps .. 'undodir'
vim.opt.backup = false
vim.opt.writebackup = false

-- Updating
vim.opt.lazyredraw = true
vim.opt.redrawtime = 1500
vim.opt.updatetime = 300
vim.opt.autoread = true

-- Cursor
vim.opt.mouse = 'nv'

-- Error
vim.opt.belloff = 'all'
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Completion
vim.opt.completeopt = {'menuone' ,'noinsert', 'noselect'}
vim.opt.complete = '.,w,b,k,i'
vim.opt.showmatch = true
vim.opt.matchtime = 5
vim.opt.pumwidth = 40
vim.opt.pumheight = 10

-- Window
vim.opt.equalalways = false
vim.opt.splitbelow = true
vim.opt.splitright = true

-- File browser
-- bsdir = 'current'

-- Grep
-- :grep <query> <directory/file>
if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = 'rg --smart-case --hidden --line-buffered --vimgrep $*'
  vim.opt.grepformat = '%f:%l:%c:%m'
elseif vim.fn.executable('ripgrep') == 1 then
  vim.opt.grepprg = 'ripgrep --smart-case --hidden --line-buffered --vimgrep $*'
  vim.opt.grepformat = '%f:%l:%c:%m'
elseif vim.fn.executable('ag') == 1 then
  vim.opt.grepprg = 'ag --vimgrep'
  -- TODO: Fix grepformat for ag, currently using ripgrep's
  vim.opt.grepformat = '%f:%l:%c:%m'
end

-- Column
vim.opt.signcolumn = 'yes:2'
vim.opt.number = true

-- Scrolling
vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 3

-- Display
vim.opt.list = true
vim.opt.listchars = {
  tab = '»·',
  nbsp = '+',
  trail = '·',
  extends = '→',
  precedes = '←'
}
vim.opt.concealcursor = 'niv'
-- vim.opt.conceallevel = 2
vim.opt.cursorline = true

-- Formatting (indent)
vim.opt.linebreak = true
vim.opt.wrap = false

-- Formatting (fold)
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'

-- History
vim.opt.swapfile = false
vim.opt.undofile = true

-- Spelling
vim.opt.spellfile = vim.fn.stdpath('data') .. ps .. 'spell' .. ps .. 'utf-8.add'

-- Formatting
-- Fix this, need to actually not use 'o'
vim.opt.formatoptions = vim.opt.formatoptions + 'r2l'

-- Formatting (indent)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

-- Formatting (wrap)
vim.opt.textwidth = 80

vim.g.vimsyn_embed = 'l'
