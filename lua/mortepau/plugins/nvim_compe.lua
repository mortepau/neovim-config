require('compe').setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',

  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    luasnip = true,
  }
})

local silent_expr = { silent = true, expr = true }

vim.inoremap('<C-Space>', 'compe#complete()', silent_expr)
vim.inoremap('<Cr>', 'compe#confirm("<Cr>")', silent_expr)
vim.inoremap('<C-e>', 'compe#close("<C-e>")', silent_expr)
vim.inoremap('<C-f>', 'compe#scroll({ "delta": +4 })', silent_expr)
vim.inoremap('<C-d>', 'compe#scroll({ "delta": -4 })', silent_expr)

vim.imap('<Tab>', 'v:lua.mortepau.editor.completion_next()', { expr = true })
vim.smap('<Tab>', 'v:lua.mortepau.editor.completion_next()', { expr = true })
vim.imap('<S-Tab>', 'v:lua.mortepau.editor.completion_prev()', { expr = true })
vim.smap('<S-Tab>', 'v:lua.mortepau.editor.completion_prev()', { expr = true })

vim.imap('<C-l>', 'v:lua.mortepau.editor.snippet_choice()', { expr = true, silent = true })
vim.smap('<C-l>', 'v:lua.mortepau.editor.snippet_choice()', { expr = true, silent = true })

-- Set the global functions used in the editor module for interacting with the
-- autocomplete menu
function mortepau.plugin_func.snippet_available_forward()
  return require('luasnip').jumpable(1)
  -- return vim.fn.call('vsnip#available', {1}) == 1
end

function mortepau.plugin_func.snippet_available_backward()
  return require('luasnip').jumpable(-1)
  -- return vim.fn.call('vsnip#jumpable', {-1}) == 1
end

function mortepau.plugin_func.snippet_jump_next()
  -- return '<Plug>(vsnip-expand-or-jump)'
  return '<Plug>luasnip-expand-or-jump'
end

function mortepau.plugin_func.snippet_jump_prev()
  -- return '<Plug>(vsnip-jump-prev)'
  return '<Plug>luasnip-jump-prev'
end

function mortepau.plugin_func.snippet_choice_available()
  return require('luasnip').choice_active()
end

function mortepau.plugin_func.snippet_choice_next()
  return '<Plug>luasnip-next-choice'
end

function mortepau.plugin_func.open_completion_menu()
  return vim.fn['compe#complete']()
end
