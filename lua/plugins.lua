local git_username = 'mortepau'
local ps = jit.os == 'Windows' and '\\' or '/'
local plugin_dir = vim.fn.expand('$HOME') .. ps .. 'plugins'

local function dir_or_git(name)
  local dir = plugin_dir .. ps .. name
  if vim.fn.isdirectory(dir) == 1 then
    return dir
  end
  return git_username .. '/' .. name
end

local plugins = {
  -- Package manager
  {
    'wbthomason/packer.nvim',
    opt = true
  },

  -- Personal plugins
  {
    dir_or_git('vim-todo'),
    config = function() require('mortepau.plugins.todo') end
  },
  {
    dir_or_git('vim-phoenix'),
    config = function() require('mortepau.plugins.phoenix') end
  },
  {
    dir_or_git('vim-duokey'),
    config = function() require('mortepau.plugins.duokey') end,
    disable = true
  },

  -- LSP
  { 'neovim/nvim-lspconfig', },
  {
    'RishabhRD/nvim-lsputils',
    requires = { 'RishabhRD/popfix' }
  },
  { 'tjdevries/nlua.nvim' },

  -- Autocompletion
  {
    'hrsh7th/nvim-compe',
    config = function() require('mortepau.plugins.nvim_compe') end
  },
  {
    'hrsh7th/vim-vsnip',
    requires = { 'cstrap/python-snippets',  },
    config = function() require('mortepau.plugins.vsnip') end
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter' },

  -- Searching
  -- TODO (mortepau): Create something simple yourself to reduce dependencies
  {
    'tjdevries/fold_search.vim',
    requires = { 'tjdevries/standard.vim', 'tjdevries/conf.vim' },
    keys = { { 'n', 'zz' } }
  },

  -- Project
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-obsession' },
  { 'tpope/vim-projectionist' },
  {
    'kkomen/vim-doge',
    run = ':call doge#install()',
    cmd = { 'DogeGenerate' }
  },
  {
    'janko/vim-test',
    requires = {
      'tpope/vim-dispatch',
      config = function() require('mortepau.plugins.dispatch') end
    },
    cmd = {
      'TestNearest',
      'TestFile',
      'TestSuite',
      'TestLast',
      'TestVisit'
    },
    config = function() require('mortepau.plugins.test') end
  },
  {
    'rafcamlet/nvim-luapad',
    cmd = { 'Luapad', 'Luarun', 'Lua' }
  },

  -- Movement
  { 'tpope/vim-unimpaired' },
  {
    'junegunn/vim-easy-align',
    keys = { { 'n', 'ga' }, { 'x', 'ga' } },
    config = function() require('mortepau.plugins.easy_align') end
  },
  {
    'tpope/vim-commentary',
    cmd = { 'Commentary' },
    keys = {
      { 'n', 'gc' },
      { 'x', 'gc' },
      { 'o', 'gc' },
      { 'n', 'gcc' },
      { 'n', 'cgc' },
      { 'n', 'cgu' },
    }
  },
  {
    'tommcdo/vim-exchange',
    keys = {
      { 'n', 'cx' },
      { 'n', 'cxc' },
      { 'n', 'cxx' },
      { 'x', 'X' },
    }
  },
  {
    'tpope/vim-repeat',
    keys = { { 'n', '.' } }
  },
  {
    'tpope/vim-abolish',
    keys = { { 'n', 'cr' } }
  },
  {
    'tpope/vim-surround',
    keys = {
      { 'n', 'ds' },
      { 'n', 'cs' },
      { 'n', 'cS' },
      { 'n', 'ys' },
      { 'n', 'yS' },
      { 'n', 'yss' },
      { 'n', 'ySs' },
      { 'n', 'ySS' },
      { 'x', 'S' },
      { 'x', 'gS' },
      { 'i', '<C-S>' },
      { 'i', '<C-G>s' },
      { 'i', '<C-G>S' }
    }
  },
  {
    'unblevable/quick-scope',
    config = function() require('mortepau.plugins.quick_scope') end
  },
  {
    'wellle/targets.vim',
    config = function() require('mortepau.plugins.targets') end
  },

  -- Visual
  { 'chrisbra/unicode.vim' },
  { 'junegunn/vim-peekaboo' },
  {
    'kshenoy/vim-signature',
    config = function() require('mortepau.plugins.signature') end
  },
  {
    'tweekmonster/braceless.vim',
    config = function() require('mortepau.plugins.braceless') end
  },
  {
    'tjdevries/overlength.vim',
    config = function() require('mortepau.plugins.overlength') end
  },
  { 'markonm/traces.vim' },
  {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = function() require('mortepau.plugins.indent_blankline') end
  },
  {
    'norcally/nvim-colorizer.lua',
    config = function() require('mortepau.plugins.colorizer') end
  },
  {
    'christoomey/vim-sort-motion',
    keys = { { 'n', 'gs' }, { 'n', 'gss' } }
  },
  {
    'godlygeek/tabular',
    cmd = { 'Tabularize' }
  },
  -- TODO (mortepau): moaqa/dial.nvim <C-a> and <C-x> enhancements

  -- Git
  {
    'tpope/vim-fugitive',
    requires = { 'tpope/vim-rhubarb' },
    config = function() require('mortepau.plugins.fugitive') end
  },
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('mortepau.plugins.gitsigns') end
  },
  -- TODO (mortepau): gitsigns lua
  {
    'rhysd/git-messenger.vim',
    cmd = { 'GitMessenger' },
    keys = { { 'n', '<leader>gm' } }
  },

  -- Filebrowsing
  {
    'nvim-lua/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
    config = function() require('mortepau.plugins.telescope') end
  },
  {
    'kyazdani42/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeClose',
      'NvimTreeRefresh',
      'NvimTreeFindFile'
    },
    keys = { { 'n', '<leader>ft' } },
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('mortepau.plugins.nvim_tree') end
  },

  -- Filetype specific

  -- Lua
  { 'tjdevries/manillua.nvim' },
  { 'euclidianAce/BetterLua.vim' },

  -- Markdown
  {
    'plasticboy/vim-markdown',
    config = function() require('mortepau.plugins.vim_markdown') end
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview' },
    run = ':call mkdp#util#install()',
    config = function() require('mortepau.plugins.markdown_preview') end
  },

  -- C, C++
  {
    'bfrg/vim-cpp-modern',
    config = function() require('mortepau.plugins.cpp_modern') end
  },

  -- Verilog, SystemVerilog
  {
    'vhda/verilog_systemverilog.vim',
    config = function() require('mortepau.plugins.verilog_systemverilog') end
  },

  -- LaTex
  {
    'lervag/vimtex',
    requires = {
      'KeitaNakamura/tex-conceal.vim',
      config = function() require('mortepau.plugins.tex_conceal') end
    },
    config = function() require('mortepau.plugins.vimtex') end
  },

  -- Elixir
  { 'elixir-editors/vim-elixir' },

  -- MATLAB
  -- TODO (mortepau): Create plugin for MATLAB not dependent on Python2
  { 'daeyun/vim-matlab' },

  -- Colorschemes
  {
    'morhetz/gruvbox',
    opt = true,
    config = function() require('mortepau.plugins.gruvbox') end
  },
  {
    'lifepillar/vim-gruvbox8',
    opt = true,
    config = function() require('mortepau.plugins.gruvbox8') end
  },
  { 'jsit/toast.vim', opt = true },
  { 'cocopon/iceberg.vim', opt = true },
  { 'bluz71/vim-moonfly-colors', opt = true },
  { 'bluz71/vim-nightfly-guicolors', opt = true },
}

mortepau.plugins = mortepau.plugins or plugins
mortepau.plugin_func = mortepau.plugin_func or {}
