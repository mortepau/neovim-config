local ps = jit.os == 'Windows' and '\\' or '/'
local plugin_dir = vim.fn.expand('$HOME') .. ps .. 'plugins'
local at_work = not user.at_home

local function dir_or_git(name)
  local dir = plugin_dir .. ps .. name
  if vim.fn.isdirectory(dir) == 1 then
    return dir
  end
  return user.git_username .. '/' .. name
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
    config = function()
      vim.g.todo_enable_partial_completion = false
    end
  },
  {
    dir_or_git('fold.nvim'),
    keys = { { 'n', 'zz' } },
    config = function()
      require('fold').setup({
        context = 7,
        tail = 150,
      })
    end,
  },
  {
    dir_or_git('vim-phoenix'),
    disable = at_work,
    ft = { 'elixir', 'eelixir' },
    opt = true,
    config = function() end,
  },
  {
    dir_or_git('codicons.nvim'),
    disable = at_work,
    opt = true,
    config = function()
      require('codicons').setup({
        ['file-code'] = 60155,
      })
    end,
  },
  {
    dir_or_git('terminal.nvim'),
    config = function()
      require('terminal').setup({
        debug_level = 'error',
        terminals = {
          {
            name = 'python',
            cmd = 'python',
            position = 'current',
          },
          {
            name = 'matlab',
            cmd = 'matlab -nodesktop -nosplash',
            position = 'right',
          },
        }
      })
    end,
  },

  -- LSP
  { 'neovim/nvim-lspconfig' },
  -- TODO(mopa): Find a subsitute for lspsaga

  -- DAP
  {
    'mfussenegger/nvim-dap',
    config = function() end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        config = function() require('user.plugins.luasnip') end,
      },
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        mapping = {
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<C-y>'] = cmp.mapping(
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true
            }),
            { 'i', 'c' }
          ),
          ['<C-Space>'] = cmp.mapping({
            i = cmp.mapping.complete(),
            c = function(fallback)
              if cmp.visible() then
                if not cmp.confirm({ select = true }) then
                  return
                end
              else
                cmp.complete()
              end
            end,
          }),
          ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, {'i' , 's'}),
          ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {'i' , 's'}),
          ['<CR>'] = cmp.config.disable,
          ['<Tab>'] = cmp.config.disable,
          ['<S-Tab>'] = cmp.config.disable,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        {
          { name = 'buffer' },
        })
      })
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
      -- 'nvim-treesitter/nvim-tree-docs',
    },
    run = ':TsUpdate',
    config = function() require('user.plugins.treesitter') end,
  },

  -- Project
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-obsession' },
  { 'tpope/vim-projectionist' },
  -- NOTE: Perhaps use treesitter-docs instead of vim-doge
  {
    'janko/vim-test',
    requires = {
      'tpope/vim-dispatch',
      config = function()
        vim.g.dispatch_compilers = {
          elixir = 'exunit'
        }
      end,
    },
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
    'rafcamlet/nvim-luapad',
    disable = at_work,
    cmd = { 'Luapad', 'Luarun', 'Lua' }
  },

  -- Movement
  { 'tpope/vim-unimpaired' },
  {
    'junegunn/vim-easy-align',
    keys = { { 'n', 'ga' }, { 'x', 'ga' } },
    config = function()
      vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { remap = true })
      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { remap = true })
    end
  },
  { 'tpope/vim-commentary' },
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
    'wellle/targets.vim',
    config = function()
      vim.g.targets_nl = { 'n', 'N' }
    end
  },

  -- Visual
  { 'junegunn/vim-peekaboo' },
  {
    'kshenoy/vim-signature',
    config = function()
      vim.g.SignatureMarkTextHL = 'SignColumn'
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.g.indent_blankline_char = '│'

      vim.g.indent_blankline_show_first_indent_level = false

      vim.g.indent_blankline_show_trailing_blankline_indent = false

      vim.g.indent_blankline_filetype_exclude = { }
      vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }

      -- Workaround for removing cursorline trail
      vim.opt.colorcolumn = '9999'
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    cmd = { 'ColorizerAttachToBuffer' },
    config = function()
      if vim.o.termguicolors == 1 then
        require('colorizer').setup()
      end
    end
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
    cmd = { 'Git' },
    keys = { { 'n', '<leader>G' } },
    requires = { 'tpope/vim-rhubarb' },
    config = function()
      -- Open the Git status and place it at the top of the viewport
      vim.nnoremap('<leader>G', ':Git<Cr><C-w>K')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('user.plugins.gitsigns') end
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
    config = function() require('user.plugins.telescope') end
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
    config = function()
      vim.g.nvim_tree_quit_on_open = true
    end
  },
  {
    'tamago324/lir.nvim',
    requires = {
      'nvim_lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require('user.plugins.lir') end,
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
    config = function()
      vim.g.vim_markdown_follow_anchor = true
      vim.g.vim_markdown_auto_instert_bullets = true
    end
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreview' },
    run = ':call mkdp#util#install()',
    config = function()
      vim.g.mkdp_auto_close = false
      vim.g.mkdp_refresh_slow = true
      vim.g.mkdp_browser = jit.os == 'OSX' and 'safari' or 'firefox'
      -- vim.g.mkdp_markdown_css = '~/.local/lib/node_modules/github-markdown-css/github-markdown-css'
    end
  },

  -- C, C++
  {
    'bfrg/vim-cpp-modern',
    config = function()
      vim.g.cpp_no_function_highlight = false
      vim.g.cpp_attributes_highlight = true
      vim.g.cpp_member_highlight = true
      vim.g.cpp_simple_highlight = false
    end
  },

  -- Verilog, SystemVerilog
  {
    'vhda/verilog_systemverilog.vim',
    config = function()
      vim.api.nvim_create_augroup('SystemVerilogBindings', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = 'SystemVerilogBindings',
        pattern = { 'systemverilog', 'verilog', 'verilog_systemverilog' },
        callback = function()
          vim.keymap.set('n', '<leader>i', ':VerilogFollowInstance<Cr>', { buffer = vim.fn.expand('<abuf>'), silent = true })
          vim.keymap.set('n', '<leader>I', ':VerilogFollowPort<Cr>', { buffer = vim.fn.expand('<abuf>'), silent = true })
          vim.keymap.set('n', '<leader>u', ':VerilogGotoInstanceStart<Cr>', { buffer = vim.fn.expand('<abuf>'), silent = true })
        end
      })
    end
  },

  -- LaTeX
  {
    'lervag/vimtex',
    ft = { 'tex', 'latex' },
    requires = {
      'KeitaNakamura/tex-conceal.vim',
      ft = { 'tex', 'latex' },
      config = function()
        vim.g.tex_conceal = 'abdmg'
      end
    },
    config = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = false
      vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.vimtex_compiler_latexmk = { build_dir = './build' }
    end
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
    config = function()
      vim.g.gruvbox_italics = true
      vim.g.gruvbox_filetype_hi_groups = true
      vim.g.gruvbox_plugin_hi_groups = true

      if user.colorscheme == 'gruvbox8' then
        vim.cmd('colorscheme gruvbox8')
      end
    end
  },
  {
    'jsit/toast.vim',
    opt = true,
    config = function()
      if user.colorscheme == 'toast' then
        vim.cmd('colorscheme toast')
      end
    end
  },
  {
    'mortepau/tokyonight.nvim',
    config = function()
      local set = function(key, value)
        vim.g['tokyonight_' .. key] = value
      end

      set('style', 'night')
      set('terminal_colors', true)
      set('italic_comments', true)
      set('sidebars', {
        'qf',
        'packer',
        'terminal'
      })
      set('dark_sidebar', true)
      set('dark_float', true)
      set('invert_comment_colors', false)
      -- TODO: Why does this trigger two messages?
      -- set('transparent', true)

      if user.colorscheme == 'tokyonight' then
        vim.cmd('colorscheme tokyonight')
      end
    end,
  },
  {
    'olimorris/onedark.nvim',
    requires = { 'rktjmp/lush.nvim', opt = true },
    config = function()
      if user.colorscheme == 'onedark_nvim' then
        vim.g.colors_name = 'onedark_nvim'
      end
    end,
  }
}

return plugins
