local system = require('system')

local Plugins = {
  -- Package manager
  {
    name = 'wbthomason/packer.nvim',
    opt = true
  },

  -- Local
  {
    name = 'vim-todo',
    local_plugin = true,
    config = function()
      vim.g.todo_enable_partial_completion = 0
    end
  },
  {
    name = 'vim-phoenix',
    local_plugin = true,
    ft = { 'elixir', 'eelixir' },
    disable = system.at_work
  },
  { 
    name = 'vim-duokey',
    local_plugin = true,
    disable = true
  },

  -- LSP
  {
    name = 'neovim/nvim-lspconfig',
    opt = true
  },
  {
    name = 'RishabhRD/nvim-lsputils',
    opt = true,
    requires = { 'RishabhRD/popfix' }
  },
  {
    name = 'tjdevries/nlua.nvim',
    opt = true
  },

  -- Completion
  {
    name = 'nvim-lua/completion-nvim',
    opt = true,
    requires = { 'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ' }
  },
  {
    name = 'sirver/ultisnips',
    opt = true,
    requires = { 'honza/vim-snippets' },
  },

  -- Statusline
  {
    name = 'tjdevries/express_line.nvim',
    opt = true
  },
  {
    name = 'itchyny/lightline.vim',
    opt = true,
    requires = { 'shinchu/lightline-gruvbox.vim' }
  },

  -- Treesitter
  {
    name = 'nvim-treesitter/nvim-treesitter',
    disable = system.at_work
  },

  -- Searching
  {
    name = 'tjdevries/fold_search.vim',
    requires = { 'tjdevries/standard.vim', 'tjdevries/conf.vim' },
    keys = {
      { 'n', 'zz' }
    }
  },

  -- Project
  {
    name = 'tpope/vim-eunuch',
  },
  {
    name = 'tpope/vim-obsession',
  },
  {
    name = 'tpope/vim-projectionist',
  },
  {
    name = 'kkomen/vim-doge',
    run = ':call doge#install()',
    cmd = { 'DogeGenerate' }
  },
  {
    name = 'janko/vim-test',
    requires = { 'tpope/vim-dispatch' },
    cmd = {
      'TestNearest',
      'TestFile',
      'TestSuite',
      'TestLast',
      'TestVisit'
    },
    config = function()
      vim.g['test#strategy'] = 'dispatch'
    end
  },
  {
    name = 'rafcamlet/nvim-luapad',
    cmd = {
      'Luapad',
      'LuaRun',
      'Lua'
    },
    disable = system.at_work
  },

  -- Movement
  {
    name = 'yaronkh/vim-winmanip',
  },
  {
    name = 'tpope/vim-unimpaired',
  },
  {
    name = 'junegunn/vim-easy-align',
    keys = {
      { 'n', 'ga' },
      { 'x', 'ga' }
    },
    config = function()
      local map = require('utils.map')
      map({
        { 'n', 'ga', '<Plug>(EasyAlign)', {} },
        { 'x', 'ga', '<Plug>(EasyAlign)', {} }
      })
    end
  },
  {
    name = 'tpope/vim-commentary',
    cmd = { 'Commentary' },
    keys = {
      { 'n', 'gc' },
      { 'x', 'gc' },
      { 'o', 'gc' },
      { 'n', 'gcc' },
      { 'n', 'cgc' },
      { 'n', 'cgu' }
    }
  },
  {
    name = 'tommcdo/vim-exchange',
    keys = {
      { 'n', 'cx' },
      { 'n', 'cxc' },
      { 'n', 'cxx' },
      { 'x', 'X' }
    }
  },
  {
    name = 'tpope/vim-repeat',
    keys = { 
      { 'n', '.' },
    }
  },
  {
    name = 'tpope/vim-abolish',
    keys = {
      { 'n', 'cr' }
    }
  },
  {
    name = 'tpope/vim-surround',
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
    name = 'unblevable/quick-scope',
    config = function()
      -- TODO: Make this work properly, errors on some lines when enabled
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      vim.g.qs_enable = 0
    end
  },
  {
    name = 'wellle/targets.vim',
    config = function()
      vim.g.targets_nl = { 'n', 'N' }
    end
  },

  -- Visual
  -- TODO: Add keys++
  {
    name = 'chrisbra/unicode.vim',
  },
  {
    name = 'junegunn/vim-peekaboo',
  },
  {
    name = 'kshenoy/vim-signature',
    config = function()
      vim.g.SignatureMarkTextHL = 'SignColumn'
    end
  },
  {
    name = 'tweekmonster/braceless.vim',
    config = function()
      local autocmd = require('utils.autocmd')
      autocmd({
        Braceless = { event = 'FileType', pat = 'python', cmd = 'BracelessEnable +indent +fold +highlight' }
      })
    end
  },
  {
    name = 'tjdevries/overlength.vim',
    config = function()
      vim.g['overlength#highlight_to_end_of_line'] = 0
    end
  },
  {
    name = 'Yggdroot/indentLine',
    config = function()
      vim.g.indentLine_setConceal = 0
      vim.g.indentLine_fileTypeExclude = { 'todo', 'text' }
      vim.g.indentLine_bufTypeExclude = { 'help' }
      vim.g.indentLine_enabled = 0
    end
  },
  {
    name = 'norcally/nvim-colorizer.lua',
    config = function()
      if vim.o.termguicolors == 1 then
        require('colorizer').setup()
      end
    end
  },
  {
    name = 'markonm/traces.vim',
  },
  {
    name = 'christoomey/vim-sort-motion',
    keys = {
      { 'n', 'gs' },
      { 'n', 'gss' }
    }
  },
  {
    name = 'godlygeek/tabular',
    cmd = { 'Tabularize' }
  },

  -- Git
  {
    name = 'tpope/vim-fugitive',
    requires = { 'tpope/vim-rhubarb' }
  },
  {
    name = 'airblade/vim-gitgutter',
    config = function()
      local map = require('utils.map')
      vim.g.gitgutter_max_signs = 500

      map({
        { 'n', ']h', '<Plug>(GitGutterNextHunk)', {}},
        { 'n', '[h', '<Plug>(GitGutterPrevHunk)', {}},
        { 'n', '<leader>hl', '<Plug>(GitGutterLineHighlightsToggle)', {}},
        { 'n', '<leader>hs', '<Plug>(GitGutterStageHunk)', {}},
        { 'n', '<leader>hu', '<Plug>(GitGutterUndoHunk)', {}},
        { 'n', '<leader>hp', '<Plug>(GitGutterPreviewHunk)', {}},
        { 'n', '<leader>hf', '<Plug>(GitGutterFold)', {}},
      })
    end
  },
  {
    name = 'rhysd/git-messenger.vim',
    cmd = { 'GitMessenger' },
    keys = { 
      { 'n', '<leader>gm' } 
    }
  },

  -- File browsing
  {
    name = 'nvim-lua/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
    config = function()
      local map = require('utils.map')
      map({
        -- General mappings
        { 'n', '<leader>fs', '<cmd>Telescope live_grep<CR>', { noremap = true }},
        { 'n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true }},
        { 'n', '<leader>fF', '<cmd>Telescope git_files<CR>', { noremap = true }},
        { 'n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true }},
        { 'n', '<leader>fm', '<cmd>Telescope marks<CR>', { noremap = true }},
        { 'n', '<leader>fq', '<cmd>Telescope quickfix<CR>', { noremap = true }},
        { 'n', '<leader>fl', '<cmd>Telescope loclist<CR>', { noremap = true }},
        { 'n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true }},
        { 'n', '<leader>fH', '<cmd>Telescope highlights<CR>', { noremap = true }},
        { 'n', '<leader>fk', '<cmd>Telescope keymaps<CR>', { noremap = true }},
        -- Git mappings
        { 'n', '<leader>fgC', '<cmd>Telescope git_commits<CR>', { noremap = true }},
        { 'n', '<leader>fgc', '<cmd>Telescope git_bcommits<CR>', { noremap = true }},
        { 'n', '<leader>fgs', '<cmd>Telescope git_status<CR>', { noremap = true }},
        { 'n', '<leader>fgb', '<cmd>Telescope git_branches<CR>', { noremap = true }},
        -- LSP mappings
      })
    end
  },
  {
    name = 'kyazdani42/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeClose',
      'NvimTreeRefresh',
      'NvimTreeFindFile'
    },
    keys = {
      { 'n', '<leader>nn' }
    },
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      local map = require('utils.map')
      map({
        { 'n', '<leader>nn', '<cmd>NvimTreeToggle<CR>', { noremap = true } }
      })
      vim.g.nvim_tree_quit_on_open = 1
      require('nvim-tree').refresh()
    end
  },

  -- Filetype
  -- Lua
  {
    name = 'tjdevries/manillua.nvim',
  },
  {
    name = 'euclidianAce/BetterLua.vim',
  },

  -- Markdown
  {
    name = 'plasticboy/vim-markdown',
    config = function()
      vim.g.vim_markdown_follow_anchor = 1
      vim.g.vim_markdown_auto_insert_bullets = 1
    end
  },
  {
    name = 'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview' },
    run = ':call mkdp#util#install()',
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_browser = 'safari'
      vim.g.mkdp_markdown_css = '~/.local/lib/node_modules/github-markdown-css/github-markdown-css'
    end
  },

  -- C families
  {
    name = 'bfrg/vim-cpp-modern',
    config = function()
      vim.g.cpp_no_function_highlight = 0
      vim.g.cpp_attributes_highlight = 1
      vim.g.cpp_member_highlight = 1
      vim.g.cpp_simple_highlight = 0
    end
  },

  -- HDL
  {
    name = 'vhda/verilog_systemverilog.vim',
    config = function()
      local autocmd = require('utils.autocmd')
      autocmd({
        SystemVerilogBindings = {
          {
            event = 'FileType',
            pat = { 'verilog', 'systemverilog', 'verilog_systemverilog' },
            cmd = 'nnoremap <buffer> <leader>i :VerilogFollowInstance<CR>' 
          },
          {
            event = 'FileType',
            pat = { 'verilog', 'systemverilog', 'verilog_systemverilog' },
            cmd = 'nnoremap <buffer> <leader>I :VerilogFollowPort<CR>' 
          },
          {
            event = 'FileType',
            pat = { 'verilog', 'systemverilog', 'verilog_systemverilog' },
            cmd = 'nnoremap <buffer> <leader>u :VerilogGotoInstanceStart<CR>' 
          },
        }})
    end,
    disable = not system.at_work
  },

  -- Latex
  {
    name = 'lervag/vimtex',
    requires = { 'KeitaNakamura/tex-conceal.vim' },
    config = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.vimtex_compiler_latexmk = { build_dir = './build' }
    end,
    disable = system.at_work
  },

  -- Elixir
  {
    name = 'elixir-editors/vim-elixir',
    disable = system.at_work
  },

  -- Matlab
  {
    name = 'daeyun/vim-matlab',
    run = ':UpdateRemotePlugins'
  },

  -- Colorschemes
  { 
    name = 'morhetz/gruvbox',
    opt = true,
    config = function()
      vim.g.gruvbox_improved_strings = 0
      vim.g.gruvbox_italic = 1
    end
  },
  {
    name = 'lifepillar/vim-gruvbox8',
    opt = true,
    config = function()
      vim.g.gruvbox_italics = 1
      vim.g.gruvbox_filetype_hi_groups = 1
      vim.g.gruvbox_plugin_hi_groups = 1
    end
  },
  {
    name = 'jsit/toast.vim',
    opt = true
  },
  {
    name = 'cocopon/iceberg.vim',
    opt = true
  },
  {
    name = 'bluz71/vim-moonfly-colors',
    opt = true
  },
  {
    name = 'bluz71/vim-nightfly-guicolors',
    opt = true
  },

  -- Tmux
  {
    name = 'tmux-plugins/vim-tmux-focus-events',
    disable = not system.has_tmux
  },
  {
    name = 'christoomey/vim-tmux-navigator',
    keys = {
      { 'n', '<C-h>' },
      { 'n', '<C-j>' },
      { 'n', '<C-k>' },
      { 'n', '<C-l>' }
    },
    disable = not system.has_tmux
  },
  {
    name = 'tmux-plugins/vim-tmux',
    ft = { 'tmux' },
    disable = not system.has_tmux
  },

  -- Required plugins
  {
    name = 'RishabhRD/popfix',
    required = true,
  },
  {
    name = 'hrsh7th/vim-vsnip',
    required = true,
    opt = true
  },
  {
    name = 'hrsh7th/vim-vsnip-integ',
    required = true,
    opt = true
  },
  {
    name = 'honza/vim-snippets',
    required = true
  },
  {
    name = 'shinchu/lightline-gruvbox.vim',
    required = true
  },
  {
    name = 'tjdevries/standard.vim',
    required = true
  },
  {
    name = 'tjdevries/conf.vim',
    required = true
  },
  {
    name = 'tpope/vim-dispatch',
    required = true,
    config = function()
      vim.g.dispatch_compilers = {
        elixir = 'exunit'
      }
    end
  },
  {
    name = 'tpope/vim-rhubarb',
    required = true
  },
  {
    name = 'nvim-lua/plenary.nvim',
    required = true
  },
  {
    name = 'nvim-lua/popup.nvim',
    required = true
  },
  {
    name = 'kyazdani42/nvim-web-devicons',
    required = true,
    disable = not system.has_nerdfont
  },
  {
    name = 'KeitaNakamura/tex-conceal.vim',
    required = true,
    config = function()
      vim.g.tex_conceal = 'abdmg'
    end
  },
}

return Plugins
