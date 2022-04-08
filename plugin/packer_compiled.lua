-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25user.plugins.luasnip\frequire\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codicons.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14file-code\3ûÕ\3\nsetup\rcodicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/codicons.nvim",
    url = "/home/mortepau/plugins/codicons.nvim"
  },
  ["fold.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\fcontext\3\a\ttail\3–\1\nsetup\tfold\frequire\0" },
    keys = { { "n", "zz" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/fold.nvim",
    url = "/home/mortepau/plugins/fold.nvim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    keys = { { "n", "<leader>gm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26user.plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÐ\2\0\0\2\0\f\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0006\0\0\0009\0\1\0004\1\0\0=\1\6\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\t\0'\1\v\0=\1\n\0K\0\1\0\t9999\16colorcolumn\bopt\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude&indent_blankline_filetype_exclude4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\bâ”‚\26indent_blankline_char\6g\bvim\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21user.plugins.lir\frequire\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["luv-vimdocs"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/luv-vimdocs",
    url = "https://github.com/nanotee/luv-vimdocs"
  },
  ["manillua.nvim"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/manillua.nvim",
    url = "https://github.com/tjdevries/manillua.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "\27LJ\2\n¢\1\0\0\2\0\n\0\0196\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0006\1\5\0009\1\6\1\a\1\a\0X\1\2€'\1\b\0X\2\1€'\1\t\0=\1\4\0K\0\1\0\ffirefox\vsafari\bOSX\aos\bjit\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireq\0\1\4\1\4\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\b€-\1\0\0009\1\1\0015\3\2\0B\1\2\2\14\0\1\0X\1\5€K\0\1\0X\1\3€-\1\0\0009\1\3\1B\1\1\1K\0\1\0\0À\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleû\1\0\1\5\3\t\0\"-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1X\1\19€-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\a\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\b\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\fvisibleÄ\1\0\1\5\2\b\0\28-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1X\1\r€-\1\1\0009\1\6\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\a\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_prev_item\fvisibleÜ\5\1\0\r\0001\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0009\t\n\0009\t\v\t)\vüÿB\t\2\0025\n\f\0B\a\3\2=\a\14\0069\a\n\0009\t\n\0009\t\v\t)\v\4\0B\t\2\0025\n\15\0B\a\3\2=\a\16\0069\a\n\0005\t\18\0009\n\n\0009\n\17\nB\n\1\2=\n\19\t9\n\n\0009\n\20\nB\n\1\2=\n\21\tB\a\2\2=\a\22\0069\a\n\0009\t\n\0009\t\23\t5\v\26\0009\f\24\0009\f\25\f=\f\27\vB\t\2\0025\n\28\0B\a\3\2=\a\29\0069\a\n\0005\t\31\0009\n\n\0009\n\30\nB\n\1\2=\n\19\t3\n \0=\n\21\tB\a\2\2=\a!\0069\a\n\0003\t\"\0005\n#\0B\a\3\2=\a$\0069\a\n\0003\t%\0005\n&\0B\a\3\2=\a'\0069\a(\0009\a)\a=\a*\0069\a(\0009\a)\a=\a+\0069\a(\0009\a)\a=\a,\6=\6\n\0059\6(\0009\6-\0064\b\3\0005\t.\0>\t\1\b5\t/\0>\t\2\b4\t\3\0005\n0\0>\n\1\tB\6\3\2=\6-\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\n<Tab>\t<CR>\fdisable\vconfig\n<C-p>\1\3\0\0\6i\6s\0\n<C-n>\1\3\0\0\6i\6s\0\14<C-Space>\0\1\0\0\rcomplete\n<C-y>\1\3\0\0\6i\6c\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerAttachToBuffer" },
    config = { "\27LJ\2\n`\0\0\3\0\6\1\v6\0\0\0009\0\1\0009\0\2\0\t\0\0\0X\0\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\18termguicolors\6o\bvim\2\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad", "Luarun", "Lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose", "NvimTreeRefresh", "NvimTreeFindFile" },
    config = { "\27LJ\2\n8\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\27nvim_tree_quit_on_open\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28user.plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n[\0\0\2\0\6\0\t6\0\0\0009\0\1\0\a\0\2\0X\0\4€6\0\3\0009\0\4\0'\1\2\0=\1\5\0K\0\1\0\16colors_name\6g\bvim\17onedark_nvim\16colorscheme\tuser\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/olimorris/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  tabular = {
    after_files = { "/home/mortepau/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    config = { "\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\6n\6N\15targets_nl\6g\bvim\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27user.plugins.telescope\frequire\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-lua/telescope.nvim"
  },
  ["terminal.nvim"] = {
    config = { "\27LJ\2\nÚ\1\0\0\5\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\4\0>\4\1\0035\4\5\0>\4\2\3=\3\6\2B\0\2\1K\0\1\0\14terminals\1\0\3\rposition\nright\bcmd matlab -nodesktop -nosplash\tname\vmatlab\1\0\3\rposition\fcurrent\bcmd\vpython\tname\vpython\1\0\1\16debug_level\nerror\nsetup\rterminal\frequire\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/terminal.nvim",
    url = "/home/mortepau/plugins/terminal.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/tex-conceal.vim",
    url = "https://github.com/KeitaNakamura/tex-conceal.vim"
  },
  ["toast.vim"] = {
    config = { "\27LJ\2\n\\\0\0\3\0\6\0\t6\0\0\0009\0\1\0\a\0\2\0X\0\4€6\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\22colorscheme toast\bcmd\bvim\ntoast\16colorscheme\tuser\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/toast.vim",
    url = "https://github.com/jsit/toast.vim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n5\0\2\5\0\3\0\a6\2\0\0009\2\1\2'\3\2\0\18\4\0\0&\3\4\3<\1\3\2K\0\1\0\16tokyonight_\6g\bvimÕ\2\1\0\5\0\16\0&3\0\0\0\18\1\0\0'\3\1\0'\4\2\0B\1\3\1\18\1\0\0'\3\3\0+\4\2\0B\1\3\1\18\1\0\0'\3\4\0+\4\2\0B\1\3\1\18\1\0\0'\3\5\0005\4\6\0B\1\3\1\18\1\0\0'\3\a\0+\4\2\0B\1\3\1\18\1\0\0'\3\b\0+\4\2\0B\1\3\1\18\1\0\0'\3\t\0+\4\1\0B\1\3\0016\1\n\0009\1\v\1\a\1\f\0X\1\4€6\1\r\0009\1\14\1'\3\15\0B\1\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\15tokyonight\16colorscheme\tuser\26invert_comment_colors\15dark_float\17dark_sidebar\1\4\0\0\aqf\vpacker\rterminal\rsidebars\20italic_comments\20terminal_colors\nnight\nstyle\0\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/mortepau/tokyonight.nvim"
  },
  ["verilog_systemverilog.vim"] = {
    config = { "\27LJ\2\në\2\0\0\t\0\17\0+6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\t\0006\6\0\0009\6\6\0069\6\a\6'\b\b\0B\6\2\2=\6\n\5B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\v\0'\4\f\0005\5\r\0006\6\0\0009\6\6\0069\6\a\6'\b\b\0B\6\2\2=\6\n\5B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\14\0'\4\15\0005\5\16\0006\6\0\0009\6\6\0069\6\a\6'\b\b\0B\6\2\2=\6\n\5B\0\5\1K\0\1\0\1\0\1\vsilent\2\":VerilogGotoInstanceStart<Cr>\14<leader>u\1\0\1\vsilent\2\27:VerilogFollowPort<Cr>\14<leader>I\vbuffer\1\0\1\vsilent\2\v<abuf>\vexpand\afn\31:VerilogFollowInstance<Cr>\14<leader>i\6n\bset\vkeymap\bvim…\2\1\0\5\0\f\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\5\0'\2\6\0005\3\a\0005\4\b\0=\4\t\0033\4\n\0=\4\v\3B\0\3\1K\0\1\0\rcallback\0\fpattern\1\4\0\0\18systemverilog\fverilog\26verilog_systemverilog\1\0\1\ngroup\26SystemVerilogBindings\rFileType\24nvim_create_autocmd\1\0\1\nclear\2\26SystemVerilogBindings\24nvim_create_augroup\bapi\bvim\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/verilog_systemverilog.vim",
    url = "https://github.com/vhda/verilog_systemverilog.vim"
  },
  ["vim-abolish"] = {
    keys = { { "n", "cr" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-cpp-modern"] = {
    config = { "\27LJ\2\n®\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0K\0\1\0\25cpp_simple_highlight\25cpp_member_highlight\29cpp_attributes_highlight\30cpp_no_function_highlight\6g\bvim\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-cpp-modern",
    url = "https://github.com/bfrg/vim-cpp-modern"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\n‡\1\0\0\6\0\t\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\1K\0\1\0\1\0\1\nremap\2\6x\1\0\1\nremap\2\22<Plug>(EasyAlign)\aga\6n\bset\vkeymap\bvim\0" },
    keys = { { "n", "ga" }, { "x", "ga" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    commands = { "Git" },
    config = { "\27LJ\2\nE\0\0\4\0\4\0\0066\0\0\0009\0\1\0'\2\2\0'\3\3\0B\0\3\1K\0\1\0\19:Git<Cr><C-w>K\14<leader>G\rnnoremap\bvim\0" },
    keys = { { "n", "<leader>G" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    config = { "\27LJ\2\nØ\1\0\0\3\0\n\0\0216\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\5\0009\0\6\0\a\0\a\0X\0\4€6\0\0\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\25colorscheme gruvbox8\bcmd\rgruvbox8\16colorscheme\tuser\29gruvbox_plugin_hi_groups\31gruvbox_filetype_hi_groups\20gruvbox_italics\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-gruvbox8",
    url = "https://github.com/lifepillar/vim-gruvbox8"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\nn\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0&vim_markdown_auto_instert_bullets\31vim_markdown_follow_anchor\6g\bvim\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-matlab"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-matlab",
    url = "https://github.com/daeyun/vim-matlab"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-peekaboo",
    url = "https://github.com/junegunn/vim-peekaboo"
  },
  ["vim-phoenix"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-phoenix",
    url = "https://github.com/mortepau/vim-phoenix"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-repeat"] = {
    keys = { { "n", "." } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-signature"] = {
    config = { "\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15SignColumn\24SignatureMarkTextHL\6g\bvim\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  },
  ["vim-sort-motion"] = {
    keys = { { "n", "gs" }, { "n", "gss" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-sort-motion",
    url = "https://github.com/christoomey/vim-sort-motion"
  },
  ["vim-surround"] = {
    keys = { { "n", "ds" }, { "n", "cs" }, { "n", "cS" }, { "n", "ys" }, { "n", "yS" }, { "n", "yss" }, { "n", "ySs" }, { "n", "ySS" }, { "x", "S" }, { "x", "gS" }, { "i", "<C-S>" }, { "i", "<C-G>s" }, { "i", "<C-G>S" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    commands = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    config = { "\27LJ\2\n8\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rdispatch\18test#strategy\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vim-test",
    url = "https://github.com/janko/vim-test"
  },
  ["vim-todo"] = {
    config = { "\27LJ\2\n@\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0#todo_enable_partial_completion\6g\bvim\0" },
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-todo",
    url = "https://github.com/mortepau/vim-todo"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  vimtex = {
    config = { "\27LJ\2\nË\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0K\0\1\0\1\0\1\14build_dir\f./build\28vimtex_compiler_latexmk\bnvr\29vimtex_compiler_progname\25vimtex_quickfix_mode\fzathura\23vimtex_view_method\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÐ\2\0\0\2\0\f\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0006\0\0\0009\0\1\0004\1\0\0=\1\6\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\t\0'\1\v\0=\1\n\0K\0\1\0\t9999\16colorcolumn\bopt\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude&indent_blankline_filetype_exclude4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\bâ”‚\26indent_blankline_char\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
try_loadstring("\27LJ\2\nn\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0&vim_markdown_auto_instert_bullets\31vim_markdown_follow_anchor\6g\bvim\0", "config", "vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21user.plugins.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: vim-todo
time([[Config for vim-todo]], true)
try_loadstring("\27LJ\2\n@\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0#todo_enable_partial_completion\6g\bvim\0", "config", "vim-todo")
time([[Config for vim-todo]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28user.plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27user.plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: terminal.nvim
time([[Config for terminal.nvim]], true)
try_loadstring("\27LJ\2\nÚ\1\0\0\5\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0005\4\4\0>\4\1\0035\4\5\0>\4\2\3=\3\6\2B\0\2\1K\0\1\0\14terminals\1\0\3\rposition\nright\bcmd matlab -nodesktop -nosplash\tname\vmatlab\1\0\3\rposition\fcurrent\bcmd\vpython\tname\vpython\1\0\1\16debug_level\nerror\nsetup\rterminal\frequire\0", "config", "terminal.nvim")
time([[Config for terminal.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireq\0\1\4\1\4\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\b€-\1\0\0009\1\1\0015\3\2\0B\1\2\2\14\0\1\0X\1\5€K\0\1\0X\1\3€-\1\0\0009\1\3\1B\1\1\1K\0\1\0\0À\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleû\1\0\1\5\3\t\0\"-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1X\1\19€-\1\1\0009\1\6\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\a\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\b\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\23expand_or_jumpable\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\fvisibleÄ\1\0\1\5\2\b\0\28-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1X\1\r€-\1\1\0009\1\6\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\a\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_prev_item\fvisibleÜ\5\1\0\r\0001\0b6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0009\t\n\0009\t\v\t)\vüÿB\t\2\0025\n\f\0B\a\3\2=\a\14\0069\a\n\0009\t\n\0009\t\v\t)\v\4\0B\t\2\0025\n\15\0B\a\3\2=\a\16\0069\a\n\0005\t\18\0009\n\n\0009\n\17\nB\n\1\2=\n\19\t9\n\n\0009\n\20\nB\n\1\2=\n\21\tB\a\2\2=\a\22\0069\a\n\0009\t\n\0009\t\23\t5\v\26\0009\f\24\0009\f\25\f=\f\27\vB\t\2\0025\n\28\0B\a\3\2=\a\29\0069\a\n\0005\t\31\0009\n\n\0009\n\30\nB\n\1\2=\n\19\t3\n \0=\n\21\tB\a\2\2=\a!\0069\a\n\0003\t\"\0005\n#\0B\a\3\2=\a$\0069\a\n\0003\t%\0005\n&\0B\a\3\2=\a'\0069\a(\0009\a)\a=\a*\0069\a(\0009\a)\a=\a+\0069\a(\0009\a)\a=\a,\6=\6\n\0059\6(\0009\6-\0064\b\3\0005\t.\0>\t\1\b5\t/\0>\t\2\b4\t\3\0005\n0\0>\n\1\tB\6\3\2=\6-\5B\3\2\0012\0\0€K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\n<Tab>\t<CR>\fdisable\vconfig\n<C-p>\1\3\0\0\6i\6s\0\n<C-n>\1\3\0\0\6i\6s\0\14<C-Space>\0\1\0\0\rcomplete\n<C-y>\1\3\0\0\6i\6c\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: targets.vim
time([[Config for targets.vim]], true)
try_loadstring("\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\6n\6N\15targets_nl\6g\bvim\0", "config", "targets.vim")
time([[Config for targets.vim]], false)
-- Config for: vim-cpp-modern
time([[Config for vim-cpp-modern]], true)
try_loadstring("\27LJ\2\n®\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0K\0\1\0\25cpp_simple_highlight\25cpp_member_highlight\29cpp_attributes_highlight\30cpp_no_function_highlight\6g\bvim\0", "config", "vim-cpp-modern")
time([[Config for vim-cpp-modern]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n5\0\2\5\0\3\0\a6\2\0\0009\2\1\2'\3\2\0\18\4\0\0&\3\4\3<\1\3\2K\0\1\0\16tokyonight_\6g\bvimÕ\2\1\0\5\0\16\0&3\0\0\0\18\1\0\0'\3\1\0'\4\2\0B\1\3\1\18\1\0\0'\3\3\0+\4\2\0B\1\3\1\18\1\0\0'\3\4\0+\4\2\0B\1\3\1\18\1\0\0'\3\5\0005\4\6\0B\1\3\1\18\1\0\0'\3\a\0+\4\2\0B\1\3\1\18\1\0\0'\3\b\0+\4\2\0B\1\3\1\18\1\0\0'\3\t\0+\4\1\0B\1\3\0016\1\n\0009\1\v\1\a\1\f\0X\1\4€6\1\r\0009\1\14\1'\3\15\0B\1\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\15tokyonight\16colorscheme\tuser\26invert_comment_colors\15dark_float\17dark_sidebar\1\4\0\0\aqf\vpacker\rterminal\rsidebars\20italic_comments\20terminal_colors\nnight\nstyle\0\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: vim-signature
time([[Config for vim-signature]], true)
try_loadstring("\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15SignColumn\24SignatureMarkTextHL\6g\bvim\0", "config", "vim-signature")
time([[Config for vim-signature]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26user.plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25user.plugins.luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: verilog_systemverilog.vim
time([[Config for verilog_systemverilog.vim]], true)
try_loadstring("\27LJ\2\në\2\0\0\t\0\17\0+6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\t\0006\6\0\0009\6\6\0069\6\a\6'\b\b\0B\6\2\2=\6\n\5B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\v\0'\4\f\0005\5\r\0006\6\0\0009\6\6\0069\6\a\6'\b\b\0B\6\2\2=\6\n\5B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\14\0'\4\15\0005\5\16\0006\6\0\0009\6\6\0069\6\a\6'\b\b\0B\6\2\2=\6\n\5B\0\5\1K\0\1\0\1\0\1\vsilent\2\":VerilogGotoInstanceStart<Cr>\14<leader>u\1\0\1\vsilent\2\27:VerilogFollowPort<Cr>\14<leader>I\vbuffer\1\0\1\vsilent\2\v<abuf>\vexpand\afn\31:VerilogFollowInstance<Cr>\14<leader>i\6n\bset\vkeymap\bvim…\2\1\0\5\0\f\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\5\0'\2\6\0005\3\a\0005\4\b\0=\4\t\0033\4\n\0=\4\v\3B\0\3\1K\0\1\0\rcallback\0\fpattern\1\4\0\0\18systemverilog\fverilog\26verilog_systemverilog\1\0\1\ngroup\26SystemVerilogBindings\rFileType\24nvim_create_autocmd\1\0\1\nclear\2\26SystemVerilogBindings\24nvim_create_augroup\bapi\bvim\0", "config", "verilog_systemverilog.vim")
time([[Config for verilog_systemverilog.vim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n[\0\0\2\0\6\0\t6\0\0\0009\0\1\0\a\0\2\0X\0\4€6\0\3\0009\0\4\0'\1\2\0=\1\5\0K\0\1\0\16colors_name\6g\bvim\17onedark_nvim\16colorscheme\tuser\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerAttachToBuffer lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerAttachToBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestNearest lua require("packer.load")({'vim-test'}, { cmd = "TestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestFile lua require("packer.load")({'vim-test'}, { cmd = "TestFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestSuite lua require("packer.load")({'vim-test'}, { cmd = "TestSuite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestLast lua require("packer.load")({'vim-test'}, { cmd = "TestLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestVisit lua require("packer.load")({'vim-test'}, { cmd = "TestVisit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Luarun lua require("packer.load")({'nvim-luapad'}, { cmd = "Luarun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[inoremap <silent> <C-G>s <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>s" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yss <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>G <cmd>lua require("packer.load")({'vim-fugitive'}, { keys = "<lt>leader>G", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>gm <cmd>lua require("packer.load")({'git-messenger.vim'}, { keys = "<lt>leader>gm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zz <cmd>lua require("packer.load")({'fold.nvim'}, { keys = "zz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cr <cmd>lua require("packer.load")({'vim-abolish'}, { keys = "cr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-G>S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>S" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> . <cmd>lua require("packer.load")({'vim-repeat'}, { keys = ".", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gs <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-S> <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-S>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gss <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'vimtex'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-phoenix'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType eelixir ++once lua require("packer.load")({'vim-phoenix'}, { ft = "eelixir" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/mortepau/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
