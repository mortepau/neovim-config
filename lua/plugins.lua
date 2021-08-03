local ps = jit.os == 'Windows' and '\\' or '/'
local plugin_dir = vim.fn.expand('$HOME') .. ps .. 'plugins'
local at_work = not mortepau.at_home

local function dir_or_git(name)
  local dir = plugin_dir .. ps .. name
  if vim.fn.isdirectory(dir) == 1 then
    return dir
  end
  return mortepau.git_username .. '/' .. name
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
    dir_or_git('fold.nvim'),
    keys = { { 'n', 'zz' } },
    config = function() require('mortepau.plugins.fold') end,
  },
  {
    dir_or_git('vim-phoenix'),
    disable = at_work,
    config = function() require('mortepau.plugins.phoenix') end
  },
  {
    dir_or_git('codicons.nvim'),
    disable = at_work,
    config = function() require('mortepau.plugins.codicons') end,
  },
  {
    dir_or_git('terminal.nvim'),
    config = function() require('mortepau.plugins.terminal') end,
  },

  -- LSP
  { 'neovim/nvim-lspconfig' },
  -- TODO: Try to remove lspsaga as I use barely anything from it
  {
    'glepnir/lspsaga.nvim',
    config = function() require('mortepau.plugins.lspsaga') end
  },
  -- { 'tjdevries/nlua.nvim' },

  -- DAP
  {
    'mfussenegger/nvim-dap',
    config = function() require('mortepau.plugins.dap') end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-compe',
    config = function() require('mortepau.plugins.nvim_compe') end
  },
  {
    'L3MON4D3/LuaSnip',
    config = function() require('mortepau.plugins.luasnip') end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      -- 'nvim-treesitter/nvim-tree-docs',
    },
    config = function() require('mortepau.plugins.treesitter') end,
  },

  -- Project
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-obsession' },
  { 'tpope/vim-projectionist' },
  -- NOTE: Perhaps use treesitter-docs instead of vim-doge
  {
    'kkoomen/vim-doge',
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
    disable = at_work,
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
  { 'junegunn/vim-peekaboo' },
  {
    'kshenoy/vim-signature',
    config = function() require('mortepau.plugins.signature') end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('mortepau.plugins.indent_blankline') end
  },
  {
    'norcalli/nvim-colorizer.lua',
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

  -- Documentation
  {
    'nanotee/luv-vimdocs',
    disable = at_work
  },

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
    -- keys = { { 'n', '<leader>ft' } },
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('mortepau.plugins.nvim_tree') end
  },
  {
    'tamago324/lir.nvim',
    requires = {
      'nvim_lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    keys = { { 'n', '<leader>ft' }, { 'n', '<leader>fT' } },
    config = function() require('mortepau.plugins.lir') end,
  },

  -- Filetype specific

  -- Lua
  {
    'tjdevries/manillua.nvim',
    disable = at_work
  },
  {
    'euclidianAce/BetterLua.vim',
    disable = at_work
  },
  {
    'folke/lua-dev.nvim',
    disable = at_work
  },

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

  -- LaTeX
  {
    'lervag/vimtex',
    requires = {
      'KeitaNakamura/tex-conceal.vim',
      config = function() require('mortepau.plugins.tex_conceal') end
    },
    config = function() require('mortepau.plugins.vimtex') end
  },

  -- Elixir
  {
    'elixir-editors/vim-elixir',
    disable = at_work
  },

  -- MATLAB
  -- TODO (mortepau): Create plugin for MATLAB not dependent on Python2
  { 'daeyun/vim-matlab' },

  -- Colorschemes
  {
    'lifepillar/vim-gruvbox8',
    opt = true,
    config = function() require('mortepau.plugins.gruvbox8') end
  },
  {
    'jsit/toast.vim',
    opt = true,
    config = function()
      if mortepau.colorscheme == 'toast' then
        vim.cmd('colorscheme toast')
      end
    end
  },
  {
    'mortepau/tokyonight.nvim',
    config = function()
      require('mortepau.plugins.tokyonight')
    end,
  },
  {
    'olimorris/onedark.nvim',
    requires = { 'rktjmp/lush.nvim' },
    config = function()
      if mortepau.colorscheme == 'onedark_nvim' then
        vim.g.colors_name = 'onedark_nvim'
      end
    end,
  }
}

mortepau.plugins = mortepau.plugins or plugins
mortepau.plugin_func = mortepau.plugin_func or {}
