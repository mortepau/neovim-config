" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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

time("Luarocks path setup", true)
local package_path_str = "/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["braceless.vim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.braceless\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/braceless.vim"
  },
  ["codicons.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.codicons\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/codicons.nvim"
  },
  ["conf.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/conf.vim"
  },
  ["fold_search.vim"] = {
    keys = { { "n", "zz" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/fold_search.vim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    keys = { { "n", "<leader>gm" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.gruvbox\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/gruvbox"
  },
  ["iceberg.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/iceberg.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&mortepau.plugins.indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.lspsaga\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["manillua.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/manillua.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&mortepau.plugins.markdown_preview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.colorizer\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.nvim_compe\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad", "Luarun", "Lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-luapad"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose", "NvimTreeRefresh", "NvimTreeFindFile" },
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.nvim_tree\frequire\0" },
    keys = { { "n", "<leader>ft" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["overlength.vim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.overlength\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/overlength.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!mortepau.plugins.quick_scope\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["standard.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/standard.vim"
  },
  tabular = {
    after_files = { "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["targets.vim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.targets\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.telescope\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["terminal.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.terminal\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/terminal.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/tex-conceal.vim"
  },
  ["toast.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/toast.vim"
  },
  ["traces.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/traces.vim"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/unicode.vim"
  },
  ["verilog_systemverilog.vim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0+mortepau.plugins.verilog_systemverilog\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/verilog_systemverilog.vim"
  },
  ["vim-abolish"] = {
    keys = { { "n", "cr" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-abolish"
  },
  ["vim-commentary"] = {
    commands = { "Commentary" },
    keys = { { "n", "gc" }, { "x", "gc" }, { "o", "gc" }, { "n", "gcc" }, { "n", "cgc" }, { "n", "cgu" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-cpp-modern"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.cpp_modern\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-cpp-modern"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-doge"] = {
    commands = { "DogeGenerate" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-doge"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.easy_align\frequire\0" },
    keys = { { "n", "ga" }, { "x", "ga" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-elixir"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-exchange"] = {
    keys = { { "n", "cx" }, { "n", "cxc" }, { "n", "cxx" }, { "x", "X" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-exchange"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.fugitive\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.gruvbox8\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-gruvbox8"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"mortepau.plugins.vim_markdown\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-matlab"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-matlab"
  },
  ["vim-moonfly-colors"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-moonfly-colors"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-nightfly-guicolors"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-phoenix"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.phoenix\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-phoenix"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-repeat"] = {
    keys = { { "n", "." } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-signature"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.signature\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sort-motion"] = {
    keys = { { "n", "gs" }, { "n", "gss" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-sort-motion"
  },
  ["vim-surround"] = {
    keys = { { "n", "ds" }, { "n", "cs" }, { "n", "cS" }, { "n", "ys" }, { "n", "yS" }, { "n", "yss" }, { "n", "ySs" }, { "n", "ySS" }, { "x", "S" }, { "x", "gS" }, { "i", "<C-S>" }, { "i", "<C-G>s" }, { "i", "<C-G>S" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-test"] = {
    commands = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26mortepau.plugins.test\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-test"
  },
  ["vim-todo"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26mortepau.plugins.todo\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-todo"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27mortepau.plugins.vsnip\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimtex = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28mortepau.plugins.vimtex\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["vsnip-snips"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vsnip-snips"
  }
}

time("Defining packer_plugins", false)
-- Config for: braceless.vim
time("Config for braceless.vim", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.braceless\frequire\0", "config", "braceless.vim")
time("Config for braceless.vim", false)
-- Config for: quick-scope
time("Config for quick-scope", true)
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!mortepau.plugins.quick_scope\frequire\0", "config", "quick-scope")
time("Config for quick-scope", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: vim-fugitive
time("Config for vim-fugitive", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.fugitive\frequire\0", "config", "vim-fugitive")
time("Config for vim-fugitive", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.nvim_compe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: verilog_systemverilog.vim
time("Config for verilog_systemverilog.vim", true)
try_loadstring("\27LJ\2\nF\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0+mortepau.plugins.verilog_systemverilog\frequire\0", "config", "verilog_systemverilog.vim")
time("Config for verilog_systemverilog.vim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: vim-signature
time("Config for vim-signature", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.signature\frequire\0", "config", "vim-signature")
time("Config for vim-signature", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: codicons.nvim
time("Config for codicons.nvim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.codicons\frequire\0", "config", "codicons.nvim")
time("Config for codicons.nvim", false)
-- Config for: vim-phoenix
time("Config for vim-phoenix", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.phoenix\frequire\0", "config", "vim-phoenix")
time("Config for vim-phoenix", false)
-- Config for: terminal.nvim
time("Config for terminal.nvim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.terminal\frequire\0", "config", "terminal.nvim")
time("Config for terminal.nvim", false)
-- Config for: overlength.vim
time("Config for overlength.vim", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.overlength\frequire\0", "config", "overlength.vim")
time("Config for overlength.vim", false)
-- Config for: lspsaga.nvim
time("Config for lspsaga.nvim", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.lspsaga\frequire\0", "config", "lspsaga.nvim")
time("Config for lspsaga.nvim", false)
-- Config for: vim-cpp-modern
time("Config for vim-cpp-modern", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.cpp_modern\frequire\0", "config", "vim-cpp-modern")
time("Config for vim-cpp-modern", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&mortepau.plugins.indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: vim-vsnip
time("Config for vim-vsnip", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27mortepau.plugins.vsnip\frequire\0", "config", "vim-vsnip")
time("Config for vim-vsnip", false)
-- Config for: targets.vim
time("Config for targets.vim", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.targets\frequire\0", "config", "targets.vim")
time("Config for targets.vim", false)
-- Config for: vimtex
time("Config for vimtex", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28mortepau.plugins.vimtex\frequire\0", "config", "vimtex")
time("Config for vimtex", false)
-- Config for: vim-markdown
time("Config for vim-markdown", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"mortepau.plugins.vim_markdown\frequire\0", "config", "vim-markdown")
time("Config for vim-markdown", false)
-- Config for: vim-todo
time("Config for vim-todo", true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26mortepau.plugins.todo\frequire\0", "config", "vim-todo")
time("Config for vim-todo", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file TestNearest lua require("packer.load")({'vim-test'}, { cmd = "TestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestFile lua require("packer.load")({'vim-test'}, { cmd = "TestFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestSuite lua require("packer.load")({'vim-test'}, { cmd = "TestSuite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestLast lua require("packer.load")({'vim-test'}, { cmd = "TestLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestVisit lua require("packer.load")({'vim-test'}, { cmd = "TestVisit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Luarun lua require("packer.load")({'nvim-luapad'}, { cmd = "Luarun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Commentary lua require("packer.load")({'vim-commentary'}, { cmd = "Commentary", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DogeGenerate lua require("packer.load")({'vim-doge'}, { cmd = "DogeGenerate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

-- Keymap lazy-loads
time("Defining lazy-load keymaps", true)
vim.cmd [[nnoremap <silent> ySS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cxx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cxx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>gm <cmd>lua require("packer.load")({'git-messenger.vim'}, { keys = "<lt>leader>gm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yss <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cgu <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "cgu", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cgc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "cgc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gcc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> . <cmd>lua require("packer.load")({'vim-repeat'}, { keys = ".", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> X <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "X", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zz <cmd>lua require("packer.load")({'fold_search.vim'}, { keys = "zz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gss <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gs <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>ft <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>ft", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-S> <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-S>" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-G>s <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>s" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cxc <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cxc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-G>S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>S" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cr <cmd>lua require("packer.load")({'vim-abolish'}, { keys = "cr", prefix = "" }, _G.packer_plugins)<cr>]]
time("Defining lazy-load keymaps", false)

if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
