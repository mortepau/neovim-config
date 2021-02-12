-- Configuration file for
-- nvim-lua/completion.nvim and nvim-lua/diagnostics.nvim
-- completion-nvim relies on vim-vsnip to use lsp snippets 

local global = require('global')
local map = require('utils.map')
local autocmd = require('utils.autocmd')

-- TODO: Might need to fix default key in map functions <10-11-20, mortepau>

local Completion = {}

function Completion:init(opts)
  if not opts.keys then
    opts.keys = {}
  end

  self.keys = {
    open = opts.keys.open or '<C-Space>',
    confirm = opts.keys.confirm or '<CR>',
    next_entry = opts.keys.next_entry or '<Tab>',
    prev_entry = opts.keys.prev_entry or '<S-Tab>',
    next_source = opts.keys.next_source or '<C-j>',
    prev_source = opts.keys.prev_source or '<C-k>'
  }

  if not opts.commands then
    opts.commands = {}
  end

  self.commands = {
    i_next = opts.commands.i_next or
      'pumvisible() ? "\\<C-n>" : ' ..
      'vsnip#jumpable(1) ? "\\<Plug>(vsnip-jump-next)" : ' ..
      'luaeval(\'require("utils.functions").check_back_space()\') ? "\\<Tab>" : ' ..
      'completion#trigger_completion()',
    i_prev = opts.commands.i_prev or
      'pumvisible() ? "\\<C-p>" : ' ..
      'vsnip#jumpable(-1) ? "\\<Plug>(vsnip-jump-prev)" : ' ..
      '"\\<S-Tab>"',
    s_next = opts.commands.s_next or
      'vsnip#jumpable(1) ? "\\<Plug>(vsnip-jump-next)" : ' ..
      '"\\<Tab>"',
    s_prev = opts.commands.s_prev or
      'vsnip#jumpable(-1) ? "\\<Plug>(vsnip-jump-prev)" : ' ..
      '"\\<S-Tab>"'
  }
end

function Completion:preload()
  -- Set the snippet source completion-nvim uses
  vim.g.completion_enable_snippet = global.snippet.provider

  -- Set what key to press to confirm and expand completion
  vim.g.completion_confirm_key = self.keys.confirm

  -- How the completion list is filtered
  vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

  -- How the completion list is sorted
  vim.g.completion_sorting = 'length'

  -- Enable smart case matching
  vim.g.completion_matching_smart_case = 1

  -- Set up different completion groups
  vim.g.completion_chain_complete_list = {
    { complete_items = { 'lsp', 'snippet' } },
    { mode = 'keyn' },
    { mode = 'file' }
  }

  -- UltiSnips configuration
  -- TODO: Move this to snippet.lua
  vim.g.UltiSnipsExpandTrigger = '<NOP>'
  vim.g.UltiSnipsJumpForwardTrigger = '<TAB>'
  vim.g.UltiSnipsJumpBackwardTrigger = '<S-TAB>'
  vim.g.UltiSnipsSnippetDirectories = { 'UltiSnips', 'my_snippets' }
end

function Completion:load()
  vim.cmd('packadd completion-nvim')
  vim.cmd('packadd ultisnips')
  vim.cmd('packadd vim-vsnip')
  vim.cmd('packadd vim-vsnip-integ')
end

function Completion:postload()
  -- Completion bindings
  map({
    -- Moving inside completion menu and jump between snippet tabstops
    { 'i', self.keys.next_entry, self.commands.i_next, { expr = true, silent = true} },
    { 'i', self.keys.prev_entry, self.commands.i_prev, { expr = true, silent = true } },
    -- Open completion menu
    { 'i', self.keys.open, 'completion#trigger_completion()', { noremap = true, silent = true, expr = true } },
    -- Iterate through completion sources
    { 'i', self.keys.prev_source, '<Plug>(completion_prev_source)', {} },
    { 'i', self.keys.next_source, '<Plug>(completion_next_source)', {} },
    -- Jump back and forth with vsnip snippets
    { 's', self.keys.next_entry, self.commands.s_next, { expr = true, silent = true } },
    { 's', self.keys.prev_entry, self.commands.s_prev, { expr = true, silent = true } },
  })

  -- Completion autocmds
  autocmd({
    -- Attach to the buffer when entering it
    CompletionOnAttach = {
      { event = 'BufEnter', pat = '*', cmd = 'lua require("completion").on_attach()' }
    },
    -- Which character trigger completion popup
    CompletionTriggerCharacter = {
      { event = 'BufEnter', pat = '*', cmd = 'let g:completion_trigger_character = ["."]' },
      { event = 'BufEnter', pat = '*.ex,*.eex', cmd = 'let g:completion_trigger_character = [".", "@"]' },
      { event = 'BufEnter', pat = '*.c,*.cpp', cmd = 'let g:completion_trigger_character = [".", ">", ":"]' },
      { event = 'BufEnter', pat = '*.vim', cmd = 'let g:completion_trigger_character = [".", ":", "#", "[", "&", "$", "<", "\'", "\\\""]' },
    },
  })
end

return Completion
