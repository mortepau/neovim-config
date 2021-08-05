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
local package_path_str = "/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.luasnip\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["codicons.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.codicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/codicons.nvim"
  },
  ["fold.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26mortepau.plugins.fold\frequire\0" },
    keys = { { "n", "zz" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/fold.nvim"
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
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&mortepau.plugins.indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25mortepau.plugins.lir\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.lspsaga\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["luv-vimdocs"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/luv-vimdocs"
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
  ["nvim-dap"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25mortepau.plugins.dap\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-dap"
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
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n_\0\0\2\0\6\0\t6\0\0\0009\0\1\0\a\0\2\0X\0\4€6\0\3\0009\0\4\0'\1\2\0=\1\5\0K\0\1\0\16colors_name\6g\bvim\17onedark_nvim\16colorscheme\rmortepau\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/popup.nvim"
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
    config = { "\27LJ\2\n`\0\0\3\0\6\0\t6\0\0\0009\0\1\0\a\0\2\0X\0\4€6\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\22colorscheme toast\bcmd\bvim\ntoast\16colorscheme\rmortepau\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/toast.vim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.tokyonight\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
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
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-commentary"
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
  vimtex = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28mortepau.plugins.vimtex\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.lspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.tokyonight\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: verilog_systemverilog.vim
time([[Config for verilog_systemverilog.vim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0+mortepau.plugins.verilog_systemverilog\frequire\0", "config", "verilog_systemverilog.vim")
time([[Config for verilog_systemverilog.vim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\2\0\6\0\t6\0\0\0009\0\1\0\a\0\2\0X\0\4€6\0\3\0009\0\4\0'\1\2\0=\1\5\0K\0\1\0\16colors_name\6g\bvim\17onedark_nvim\16colorscheme\rmortepau\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: vim-phoenix
time([[Config for vim-phoenix]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.phoenix\frequire\0", "config", "vim-phoenix")
time([[Config for vim-phoenix]], false)
-- Config for: vim-cpp-modern
time([[Config for vim-cpp-modern]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.cpp_modern\frequire\0", "config", "vim-cpp-modern")
time([[Config for vim-cpp-modern]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vim-signature
time([[Config for vim-signature]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.signature\frequire\0", "config", "vim-signature")
time([[Config for vim-signature]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.nvim_compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 mortepau.plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: targets.vim
time([[Config for targets.vim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.targets\frequire\0", "config", "targets.vim")
time([[Config for targets.vim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25mortepau.plugins.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"mortepau.plugins.vim_markdown\frequire\0", "config", "vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31mortepau.plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.fugitive\frequire\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: vim-todo
time([[Config for vim-todo]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26mortepau.plugins.todo\frequire\0", "config", "vim-todo")
time([[Config for vim-todo]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&mortepau.plugins.indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29mortepau.plugins.luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: terminal.nvim
time([[Config for terminal.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30mortepau.plugins.terminal\frequire\0", "config", "terminal.nvim")
time([[Config for terminal.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25mortepau.plugins.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28mortepau.plugins.vimtex\frequire\0", "config", "vimtex")
time([[Config for vimtex]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestFile lua require("packer.load")({'vim-test'}, { cmd = "TestFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestSuite lua require("packer.load")({'vim-test'}, { cmd = "TestSuite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestLast lua require("packer.load")({'vim-test'}, { cmd = "TestLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestVisit lua require("packer.load")({'vim-test'}, { cmd = "TestVisit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Luarun lua require("packer.load")({'nvim-luapad'}, { cmd = "Luarun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestNearest lua require("packer.load")({'vim-test'}, { cmd = "TestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[inoremap <silent> <C-G>S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>S" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-S> <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-S>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cr <cmd>lua require("packer.load")({'vim-abolish'}, { keys = "cr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>gm <cmd>lua require("packer.load")({'git-messenger.vim'}, { keys = "<lt>leader>gm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gs <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> . <cmd>lua require("packer.load")({'vim-repeat'}, { keys = ".", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zz <cmd>lua require("packer.load")({'fold.nvim'}, { keys = "zz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-G>s <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>s" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gss <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yss <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySS", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
