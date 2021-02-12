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
local package_path_str = "/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mortepau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["braceless.vim"] = {
    config = { "\27LJ\2\n˜\1\0\0\5\0\5\0\t6\0\0\0'\2\1\0B\0\2\2\18\1\0\0005\3\3\0005\4\2\0=\4\4\3B\1\2\1K\0\1\0\14Braceless\1\0\0\1\0\3\nevent\rFileType\bpat\vpython\bcmd-BracelessEnable +indent +fold +highlight\18utils.autocmd\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/braceless.vim"
  },
  ["completion-nvim"] = {
    after = { "vim-vsnip", "vim-vsnip-integ" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/completion-nvim"
  },
  ["conf.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/conf.vim"
  },
  ["express_line.nvim"] = {
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/express_line.nvim"
  },
  ["fold_search.vim"] = {
    keys = { { "n", "zz" } },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/fold_search.vim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    keys = { { "n", "<leader>gm" } },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/git-messenger.vim"
  },
  gruvbox = {
    config = { "\27LJ\2\nY\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\19gruvbox_italic\29gruvbox_improved_strings\6g\bvim\0" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/gruvbox"
  },
  ["iceberg.vim"] = {
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/iceberg.vim"
  },
  indentLine = {
    config = { "\27LJ\2\nÆ\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0K\0\1\0\23indentLine_enabled\1\2\0\0\thelp\30indentLine_bufTypeExclude\1\3\0\0\ttodo\ttext\31indentLine_fileTypeExclude\26indentLine_setConceal\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lightline-gruvbox.vim"] = {
    load_after = {
      ["lightline.vim"] = true
    },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/lightline-gruvbox.vim"
  },
  ["lightline.vim"] = {
    after = { "lightline-gruvbox.vim" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/lightline.vim"
  },
  ["manillua.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/manillua.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "\27LJ\2\nÛ\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0K\0\1\0F~/.local/lib/node_modules/github-markdown-css/github-markdown-css\22mkdp_markdown_css\vsafari\17mkdp_browser\22mkdp_refresh_slow\20mkdp_auto_close\6g\bvim\0" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nlua.nvim"] = {
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/nlua.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n`\0\0\3\0\6\1\v6\0\0\0009\0\1\0009\0\2\0\t\0\0\0X\0\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\18termguicolors\6o\bvim\2\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    after = { "popfix" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-lsputils"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad", "LuaRun", "Lua" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/nvim-luapad"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose", "NvimTreeRefresh", "NvimTreeFindFile" },
    config = { "\27LJ\2\nÍ\1\0\0\6\0\t\0\0206\0\0\0'\2\1\0B\0\2\2\18\1\0\0004\3\3\0005\4\2\0005\5\3\0>\5\4\4>\4\1\3B\1\2\0016\1\4\0009\1\5\1)\2\1\0=\2\6\0016\1\0\0'\3\a\0B\1\2\0029\1\b\1B\1\1\1K\0\1\0\frefresh\14nvim-tree\27nvim_tree_quit_on_open\6g\bvim\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>nn\28<cmd>NvimTreeToggle<CR>\14utils.map\frequire\0" },
    keys = { { "n", "<leader>nn" } },
    loaded = false,
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
    config = { "\27LJ\2\nE\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0(overlength#highlight_to_end_of_line\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/overlength.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    load_after = {
      ["nvim-lsputils"] = true
    },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\n\\\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0K\0\1\0\14qs_enable\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["standard.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/standard.vim"
  },
  tabular = {
    commands = { "Tabularize" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["targets.vim"] = {
    config = { "\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\6n\6N\15targets_nl\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÅ\b\0\0\6\0\30\0?6\0\0\0'\2\1\0B\0\2\2\18\1\0\0004\3\15\0005\4\2\0005\5\3\0>\5\4\4>\4\1\0035\4\4\0005\5\5\0>\5\4\4>\4\2\0035\4\6\0005\5\a\0>\5\4\4>\4\3\0035\4\b\0005\5\t\0>\5\4\4>\4\4\0035\4\n\0005\5\v\0>\5\4\4>\4\5\0035\4\f\0005\5\r\0>\5\4\4>\4\6\0035\4\14\0005\5\15\0>\5\4\4>\4\a\0035\4\16\0005\5\17\0>\5\4\4>\4\b\0035\4\18\0005\5\19\0>\5\4\4>\4\t\0035\4\20\0005\5\21\0>\5\4\4>\4\n\0035\4\22\0005\5\23\0>\5\4\4>\4\v\0035\4\24\0005\5\25\0>\5\4\4>\4\f\0035\4\26\0005\5\27\0>\5\4\4>\4\r\0035\4\28\0005\5\29\0>\5\4\4>\4\14\3B\1\2\1K\0\1\0\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgb$<cmd>Telescope git_branches<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgs\"<cmd>Telescope git_status<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgc$<cmd>Telescope git_bcommits<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgC#<cmd>Telescope git_commits<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fk\31<cmd>Telescope keymaps<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fH\"<cmd>Telescope highlights<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fh!<cmd>Telescope help_tags<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fl\31<cmd>Telescope loclist<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fq <cmd>Telescope quickfix<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fm\29<cmd>Telescope marks<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fb\31<cmd>Telescope buffers<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fF!<cmd>Telescope git_files<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>ff\"<cmd>Telescope find_files<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fs!<cmd>Telescope live_grep<CR>\14utils.map\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    config = { "\27LJ\2\n3\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nabdmg\16tex_conceal\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/tex-conceal.vim"
  },
  ["toast.vim"] = {
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/toast.vim"
  },
  ["traces.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/traces.vim"
  },
  ultisnips = {
    after = { "vim-snippets" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/ultisnips"
  },
  ["unicode.vim"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/unicode.vim"
  },
  ["vim-abolish"] = {
    keys = { { "n", "cr" } },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-abolish"
  },
  ["vim-commentary"] = {
    commands = { "Commentary" },
    keys = { { "n", "gc" }, { "x", "gc" }, { "o", "gc" }, { "n", "gcc" }, { "n", "cgc" }, { "n", "cgu" } },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-cpp-modern"] = {
    config = { "\27LJ\2\n®\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0K\0\1\0\25cpp_simple_highlight\25cpp_member_highlight\29cpp_attributes_highlight\30cpp_no_function_highlight\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-cpp-modern"
  },
  ["vim-dispatch"] = {
    config = { "\27LJ\2\nE\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\velixir\vexunit\23dispatch_compilers\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-doge"] = {
    commands = { "DogeGenerate" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-doge"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\n‹\1\0\0\6\0\4\0\0156\0\0\0'\2\1\0B\0\2\2\18\1\0\0004\3\3\0005\4\2\0004\5\0\0>\5\4\4>\4\1\0035\4\3\0004\5\0\0>\5\4\4>\4\2\3B\1\2\1K\0\1\0\1\4\0\0\6x\aga\22<Plug>(EasyAlign)\1\4\0\0\6n\aga\22<Plug>(EasyAlign)\14utils.map\frequire\0" },
    keys = { { "n", "ga" }, { "x", "ga" } },
    loaded = false,
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
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\nø\3\0\0\6\0\f\0'6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1)\2ô\1=\2\4\1\18\1\0\0004\3\b\0005\4\5\0004\5\0\0>\5\4\4>\4\1\0035\4\6\0004\5\0\0>\5\4\4>\4\2\0035\4\a\0004\5\0\0>\5\4\4>\4\3\0035\4\b\0004\5\0\0>\5\4\4>\4\4\0035\4\t\0004\5\0\0>\5\4\4>\4\5\0035\4\n\0004\5\0\0>\5\4\4>\4\6\0035\4\v\0004\5\0\0>\5\4\4>\4\a\3B\1\2\1K\0\1\0\1\4\0\0\6n\15<leader>hf\26<Plug>(GitGutterFold)\1\4\0\0\6n\15<leader>hp!<Plug>(GitGutterPreviewHunk)\1\4\0\0\6n\15<leader>hu\30<Plug>(GitGutterUndoHunk)\1\4\0\0\6n\15<leader>hs\31<Plug>(GitGutterStageHunk)\1\4\0\0\6n\15<leader>hl*<Plug>(GitGutterLineHighlightsToggle)\1\4\0\0\6n\a[h\30<Plug>(GitGutterPrevHunk)\1\4\0\0\6n\a]h\30<Plug>(GitGutterNextHunk)\24gitgutter_max_signs\6g\bvim\14utils.map\frequire\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-gruvbox8"] = {
    config = { "\27LJ\2\n…\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\29gruvbox_plugin_hi_groups\31gruvbox_filetype_hi_groups\20gruvbox_italics\6g\bvim\0" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-gruvbox8"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\nm\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0%vim_markdown_auto_insert_bullets\31vim_markdown_follow_anchor\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-matlab"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-matlab"
  },
  ["vim-moonfly-colors"] = {
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-moonfly-colors"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = false,
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
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-phoenix"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-repeat"] = {
    keys = { { "n", "." } },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-signature"] = {
    config = { "\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15SignColumn\24SignatureMarkTextHL\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snippets"] = {
    load_after = {
      ultisnips = true
    },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-snippets"
  },
  ["vim-sort-motion"] = {
    keys = { { "n", "gs" }, { "n", "gss" } },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-sort-motion"
  },
  ["vim-surround"] = {
    keys = { { "n", "ds" }, { "n", "cs" }, { "n", "cS" }, { "n", "ys" }, { "n", "yS" }, { "n", "yss" }, { "n", "ySs" }, { "n", "ySS" }, { "x", "S" }, { "x", "gS" }, { "i", "<C-S>" }, { "i", "<C-G>s" }, { "i", "<C-G>S" } },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-test"] = {
    commands = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    config = { "\27LJ\2\n8\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rdispatch\18test#strategy\6g\bvim\0" },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-test"
  },
  ["vim-todo"] = {
    config = { "\27LJ\2\n@\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0#todo_enable_partial_completion\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-todo"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    load_after = {
      ["completion-nvim"] = true
    },
    loaded = false,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  },
  ["vim-winmanip"] = {
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vim-winmanip"
  },
  vimtex = {
    config = { "\27LJ\2\nË\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0K\0\1\0\1\0\1\14build_dir\f./build\28vimtex_compiler_latexmk\bnvr\29vimtex_compiler_progname\25vimtex_quickfix_mode\fzathura\23vimtex_view_method\6g\bvim\0" },
    loaded = true,
    path = "/Users/mortepau/.local/share/nvim/site/pack/packer/start/vimtex"
  }
}

-- Config for: quick-scope
try_loadstring("\27LJ\2\n\\\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0K\0\1\0\14qs_enable\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0", "config", "quick-scope")
-- Config for: vim-todo
try_loadstring("\27LJ\2\n@\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0#todo_enable_partial_completion\6g\bvim\0", "config", "vim-todo")
-- Config for: indentLine
try_loadstring("\27LJ\2\nÆ\1\0\0\2\0\b\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0K\0\1\0\23indentLine_enabled\1\2\0\0\thelp\30indentLine_bufTypeExclude\1\3\0\0\ttodo\ttext\31indentLine_fileTypeExclude\26indentLine_setConceal\6g\bvim\0", "config", "indentLine")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\nÅ\b\0\0\6\0\30\0?6\0\0\0'\2\1\0B\0\2\2\18\1\0\0004\3\15\0005\4\2\0005\5\3\0>\5\4\4>\4\1\0035\4\4\0005\5\5\0>\5\4\4>\4\2\0035\4\6\0005\5\a\0>\5\4\4>\4\3\0035\4\b\0005\5\t\0>\5\4\4>\4\4\0035\4\n\0005\5\v\0>\5\4\4>\4\5\0035\4\f\0005\5\r\0>\5\4\4>\4\6\0035\4\14\0005\5\15\0>\5\4\4>\4\a\0035\4\16\0005\5\17\0>\5\4\4>\4\b\0035\4\18\0005\5\19\0>\5\4\4>\4\t\0035\4\20\0005\5\21\0>\5\4\4>\4\n\0035\4\22\0005\5\23\0>\5\4\4>\4\v\0035\4\24\0005\5\25\0>\5\4\4>\4\f\0035\4\26\0005\5\27\0>\5\4\4>\4\r\0035\4\28\0005\5\29\0>\5\4\4>\4\14\3B\1\2\1K\0\1\0\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgb$<cmd>Telescope git_branches<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgs\"<cmd>Telescope git_status<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgc$<cmd>Telescope git_bcommits<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\16<leader>fgC#<cmd>Telescope git_commits<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fk\31<cmd>Telescope keymaps<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fH\"<cmd>Telescope highlights<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fh!<cmd>Telescope help_tags<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fl\31<cmd>Telescope loclist<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fq <cmd>Telescope quickfix<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fm\29<cmd>Telescope marks<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fb\31<cmd>Telescope buffers<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fF!<cmd>Telescope git_files<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>ff\"<cmd>Telescope find_files<CR>\1\0\1\fnoremap\2\1\4\0\0\6n\15<leader>fs!<cmd>Telescope live_grep<CR>\14utils.map\frequire\0", "config", "telescope.nvim")
-- Config for: targets.vim
try_loadstring("\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\6n\6N\15targets_nl\6g\bvim\0", "config", "targets.vim")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n`\0\0\3\0\6\1\v6\0\0\0009\0\1\0009\0\2\0\t\0\0\0X\0\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\18termguicolors\6o\bvim\2\0", "config", "nvim-colorizer.lua")
-- Config for: overlength.vim
try_loadstring("\27LJ\2\nE\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0(overlength#highlight_to_end_of_line\6g\bvim\0", "config", "overlength.vim")
-- Config for: vim-cpp-modern
try_loadstring("\27LJ\2\n®\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0K\0\1\0\25cpp_simple_highlight\25cpp_member_highlight\29cpp_attributes_highlight\30cpp_no_function_highlight\6g\bvim\0", "config", "vim-cpp-modern")
-- Config for: vim-markdown
try_loadstring("\27LJ\2\nm\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0%vim_markdown_auto_insert_bullets\31vim_markdown_follow_anchor\6g\bvim\0", "config", "vim-markdown")
-- Config for: vim-dispatch
try_loadstring("\27LJ\2\nE\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\velixir\vexunit\23dispatch_compilers\6g\bvim\0", "config", "vim-dispatch")
-- Config for: vim-gitgutter
try_loadstring("\27LJ\2\nø\3\0\0\6\0\f\0'6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1)\2ô\1=\2\4\1\18\1\0\0004\3\b\0005\4\5\0004\5\0\0>\5\4\4>\4\1\0035\4\6\0004\5\0\0>\5\4\4>\4\2\0035\4\a\0004\5\0\0>\5\4\4>\4\3\0035\4\b\0004\5\0\0>\5\4\4>\4\4\0035\4\t\0004\5\0\0>\5\4\4>\4\5\0035\4\n\0004\5\0\0>\5\4\4>\4\6\0035\4\v\0004\5\0\0>\5\4\4>\4\a\3B\1\2\1K\0\1\0\1\4\0\0\6n\15<leader>hf\26<Plug>(GitGutterFold)\1\4\0\0\6n\15<leader>hp!<Plug>(GitGutterPreviewHunk)\1\4\0\0\6n\15<leader>hu\30<Plug>(GitGutterUndoHunk)\1\4\0\0\6n\15<leader>hs\31<Plug>(GitGutterStageHunk)\1\4\0\0\6n\15<leader>hl*<Plug>(GitGutterLineHighlightsToggle)\1\4\0\0\6n\a[h\30<Plug>(GitGutterPrevHunk)\1\4\0\0\6n\a]h\30<Plug>(GitGutterNextHunk)\24gitgutter_max_signs\6g\bvim\14utils.map\frequire\0", "config", "vim-gitgutter")
-- Config for: vim-signature
try_loadstring("\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15SignColumn\24SignatureMarkTextHL\6g\bvim\0", "config", "vim-signature")
-- Config for: tex-conceal.vim
try_loadstring("\27LJ\2\n3\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nabdmg\16tex_conceal\6g\bvim\0", "config", "tex-conceal.vim")
-- Config for: vimtex
try_loadstring("\27LJ\2\nË\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0K\0\1\0\1\0\1\14build_dir\f./build\28vimtex_compiler_latexmk\bnvr\29vimtex_compiler_progname\25vimtex_quickfix_mode\fzathura\23vimtex_view_method\6g\bvim\0", "config", "vimtex")
-- Config for: braceless.vim
try_loadstring("\27LJ\2\n˜\1\0\0\5\0\5\0\t6\0\0\0'\2\1\0B\0\2\2\18\1\0\0005\3\3\0005\4\2\0=\4\4\3B\1\2\1K\0\1\0\14Braceless\1\0\0\1\0\3\nevent\rFileType\bpat\vpython\bcmd-BracelessEnable +indent +fold +highlight\18utils.autocmd\frequire\0", "config", "braceless.vim")

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file DogeGenerate lua require("packer.load")({'vim-doge'}, { cmd = "DogeGenerate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestNearest lua require("packer.load")({'vim-test'}, { cmd = "TestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestFile lua require("packer.load")({'vim-test'}, { cmd = "TestFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestSuite lua require("packer.load")({'vim-test'}, { cmd = "TestSuite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestLast lua require("packer.load")({'vim-test'}, { cmd = "TestLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file TestVisit lua require("packer.load")({'vim-test'}, { cmd = "TestVisit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Lua lua require("packer.load")({'nvim-luapad'}, { cmd = "Lua", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Commentary lua require("packer.load")({'vim-commentary'}, { cmd = "Commentary", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file LuaRun lua require("packer.load")({'nvim-luapad'}, { cmd = "LuaRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

-- Keymap lazy-loads
vim.cmd [[nnoremap <silent> gss <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gs <cmd>lua require("packer.load")({'vim-sort-motion'}, { keys = "gs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-G>S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>S" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-G>s <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-G>s" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-S> <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>C-S>" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> S <cmd>lua require("packer.load")({'vim-surround'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> . <cmd>lua require("packer.load")({'vim-repeat'}, { keys = ".", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ySs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ySs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yss <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yss", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> yS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "yS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ys <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ys", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cS <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cs <cmd>lua require("packer.load")({'vim-surround'}, { keys = "cs", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cxx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cxx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ds <cmd>lua require("packer.load")({'vim-surround'}, { keys = "ds", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>gm <cmd>lua require("packer.load")({'git-messenger.vim'}, { keys = "<lt>leader>gm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> X <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "X", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zz <cmd>lua require("packer.load")({'fold_search.vim'}, { keys = "zz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cr <cmd>lua require("packer.load")({'vim-abolish'}, { keys = "cr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> ga <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "ga", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cgu <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "cgu", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gcc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>nn <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>nn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cx <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cx", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cxc <cmd>lua require("packer.load")({'vim-exchange'}, { keys = "cxc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> cgc <cmd>lua require("packer.load")({'vim-commentary'}, { keys = "cgc", prefix = "" }, _G.packer_plugins)<cr>]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType eelixir ++once lua require("packer.load")({'vim-phoenix'}, { ft = "eelixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-phoenix'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
