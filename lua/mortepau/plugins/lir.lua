local lazy = require('mortepau.lazy_require')

local lir = lazy.require('lir')
local actions = lazy.require('lir.actions')
local mark_actions = lazy.require('lir.mark.actions')
local clipboard_actions = lazy.require('lir.clipboard.actions')
local lir_utils = lazy.require('lir.utils')
local lir_config = lazy.require('lir.config')

local Path = lazy.require('plenary.path')

-- Move to the git root
local function goto_git_root()
  local dir = require'lspconfig.util'.find_git_ancestor(vim.fn.getcwd())
  if dir == nil or dir == "" then
    return
  end
  vim.cmd ('e ' .. dir)
end

-- Custom handler for new file/directory
local no_confirm_patterns = {
  '^LICENSE$',
  '^Makefile$'
}

local need_confirm = function(filename)
  for _, pattern in ipairs(no_confirm_patterns) do
    if filename:match(pattern) then
      return false
    end
  end
  return true
end

local function lcd(dir)
  vim.cmd('lcd ' .. dir)
end

local function input_newfile()
  local save_curdir = vim.fn.getcwd()
  lcd(lir.get_context().dir)
  local name = vim.fn.input('New file: ', '', 'file')
  lcd(save_curdir)

  if name == '' then
    return
  end

  if name == '.' or name == '..' then
    lir_utils.error('Invalid file name: ' .. name)
    return
  end

  -- If I need to check, I will.
  if need_confirm(name) then
    -- '.' is not included or '/' is not included, then
    -- I may have entered it as a directory, I'll check.
    if not name:match('%.') and not name:match('/') then
      if vim.fn.confirm("Directory?", "&No\n&Yes", 1) == 2 then
        name = name .. '/'
      end
    end
  end

  local path = Path:new(lir.get_context().dir .. name)
  if string.match(name, '/$') then
    -- mkdir
    name = name:gsub('/$', '')
    path:mkdir({
      parents = true,
      mode = tonumber('700', 8),
      exists_ok = false
    })
  else
    -- touch
    path:touch({
      parents = true,
      mode = tonumber('644', 8),
    })
  end

  -- If the first character is '.' and show_hidden_files is false, set it to true
  if name:match([[^%.]]) and not lir_config.values.show_hidden_files then
    lir_config.values.show_hidden_files = true
  end

  actions.reload()

  -- Jump to a line in the parent directory of the file you created.
  local lnum = lir.get_context():indexof(name:match('^[^/]+'))
  if lnum then
    vim.cmd(tostring(lnum))
  end
end

-- Open the $HOME directory
local function home()
  vim.cmd('edit ' .. vim.fn.expand('$HOME'))
end

local function quit()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins > 1 then
    actions.quit()
    vim.cmd('close')
  else
    actions.quit()
  end
end

lir.setup({
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['<CR>'] = actions.edit,
    ['l'] = actions.edit,
    ['<C-v>'] = actions.vsplit,
    ['<C-s>'] = actions.split,
    ['<C-t>'] = actions.tabedit,

    ['h'] = actions.up,
    ['q'] = quit,
    ['r'] = actions.reload,

    ['R'] = actions.rename,
    ['D'] = actions.delete,
    ['N'] = input_newfile,
    ['Y'] = actions.yank_path,
    ['.'] = actions.toggle_show_hidden,
    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,

    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,

    ['~'] = home,
    ['H'] = goto_git_root,
  }
})

vim.nnoremap('<leader>ft', function() vim.cmd('edit .') end, { silent = true })
