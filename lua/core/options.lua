local global = require('system')
local provider = require('provider')
local options = {}

-- TODO: Fix comment on o and O

function options:load()
  -- Global options
  self.global = {
    -- System
    encoding = 'UTF-8',
    fileformats = 'unix,dos,mac',

    -- Colors
    termguicolors = true,
    background = 'dark',

    -- Buffer
    hidden = true,
    switchbuf = 'useopen,usetab,vsplit',

    -- Statusline
    showmode = false,
    showtabline = 1,
    cmdheight = 2,
    laststatus = 2,
    ruler = true,
    shortmess = 'filmnrxoOtTcF',

    -- Scrolling
    sidescroll = 1,

    -- Backspacing
    backspace = 'indent,eol,start',

    -- Formatting (indent)
    shiftround = true,
    smarttab = true,

    -- Formatting (wrap)
    showbreak = '↳ ',
    whichwrap = '<,>,h,l',

    -- Formatting (fold)
    foldlevelstart = 99,

    -- Searching
    ignorecase = true,
    smartcase = true,
    incsearch = true,
    hlsearch = true,
    magic = true,
    inccommand='split',
    -- TODO: Set path
    path = '.,/usr/include,,~/.config/**',

    -- Menu
    wildmenu = true,
    wildmode = 'longest,full',
    wildignore = '*.o,*~,*.pyc,.git,.hg,.svn,*.out,*.jpg,*.png,*.jpeg,*.gif,*.DS_Store,**' .. global.path_separator .. 'node_modules' .. global.path_separator .. '**',

    -- History
    history = 500,
    undodir = global.data_dir .. global.path_separator .. 'tmp_dirs' .. global.path_separator .. 'undodir',
    backup = false,
    writebackup = false,

    -- Updating
    lazyredraw = true,
    redrawtime = 1500,
    updatetime = 300,
    autoread = true,

    -- Cursor
    mouse = 'nv',

    -- Error
    belloff = 'all',
    errorbells = false,
    visualbell = false,

    -- Completion
    completeopt = 'menuone,noinsert,noselect',
    complete = '.,w,b,k,i',
    showmatch = true,
    matchtime = 5,
    pumwidth = 7,
    pumheight = 40,

    -- Window
    equalalways = false,
    splitbelow = true,
    splitright = true,

    -- File browser
    -- bsdir = 'current'

    -- Grep
    -- TODO: Should be set based on what provider we have
    -- grepprg = provider.tools.grepper.prog('', nil, '')
    -- grepformat = '%f:%l:%c:%m',
  }

  -- Window-local options
  self.window = {
    -- Column
    signcolumn = 'yes:1',
    number = true,

    -- Scrolling
    scrolloff = 7,
    sidescrolloff = 3,

    -- Display
    list = true,
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    concealcursor = 'niv',
    conceallevel = 2,
    cursorline = true,

    -- Formatting (indent)
    linebreak = true,
    wrap = false,

    -- Formatting (fold)
    foldenable = true,
    foldmethod = 'indent'
  }

  -- Buffer-local options
  self.buffer = {
    -- History
    swapfile = false,
    undofile = true,

    -- Spelling
    spellfile = global.data_dir .. global.path_separator .. 'spell' .. global.path_separator .. 'utf-8.add',

    -- Formatting
    -- Fix this, need to actually not use 'o'
    formatoptions = 'crq2jl',

    -- Formatting (indent)
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    autoindent = true,
    smartindent = true,
    expandtab = true,

    -- Formatting (wrap)
    textwidth = 80
  }
end

function options:set()
  for name, value in pairs(self.global) do
    vim.o[name] = value
  end

  for name, value in pairs(self.window) do
    vim.wo[name] = value
  end

  for name, value in pairs(self.buffer) do
    vim.bo[name] = value
    vim.o[name] = value
  end
end

return options
