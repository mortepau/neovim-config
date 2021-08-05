local lazy = require('mortepau.lazy_require')
local builtins = lazy.require("telescope.builtin")
local theme = lazy.require("telescope.themes")

local prefix = '<leader>f'

local function live_grep()
  builtins.live_grep({ layout_strategy = 'vertical' })
end
local function find_files()
  builtins.find_files(theme.get_ivy({ hidden = false }))
end
local function git_files()
  builtins.git_files(theme.get_ivy())
end
local function buffers()
  builtins.buffers(theme.get_dropdown({ previewer = false }))
end

local function dotfiles()
  builtins.find_files({
    prompt_title = '~ Dotfiles ~',
    shorten_path = false,
    cwd = '~/.config/nvim',

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  })
end

local function git_commits() builtins.git_commits(theme.get_ivy()) end
local function git_bcommits() builtins.git_bcommits(theme.get_ivy()) end
local function git_status()
  builtins.git_status({
    theme = 'vertical',
    layout_config = {
      preview_width = 0.6,
    }
  })
end
local function git_branches()
  builtins.git_branches(theme.get_dropdown({ previewer = false }))
end
local function git_stash()
  builtins.git_stash(theme.get_dropdown({ previewer = false }))
end

local function marks()
  builtins.marks(theme.get_ivy())
end

local function registers()
  builtins.registers(theme.get_ivy())
end

local function quickfix()
  builtins.quickfix({
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.7
    }
  })
end

local function loclist()
  builtins.loclist({
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.7
    }
  })
end

local silent = { silent = true }
vim.nnoremap(prefix .. 's', live_grep, silent)
vim.nnoremap(prefix .. 'f', find_files, silent)
vim.nnoremap(prefix .. 'F', git_files, silent)
vim.nnoremap(prefix .. 'b', buffers, silent)
vim.nnoremap(prefix .. 'c', dotfiles, silent)

vim.nnoremap(prefix .. 'gC', git_commits, silent)
vim.nnoremap(prefix .. 'gc', git_bcommits, silent)
vim.nnoremap(prefix .. 'gs', git_status, silent)
vim.nnoremap(prefix .. 'gS', git_stash, silent)
vim.nnoremap(prefix .. 'gb', git_branches, silent)

vim.nnoremap(prefix .. 'm', marks, silent)
vim.nnoremap(prefix .. 'r', registers, silent)
vim.nnoremap(prefix .. 'q', quickfix, silent)
vim.nnoremap(prefix .. 'l', loclist, silent)
