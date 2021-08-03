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

if mortepau.colorscheme == 'tokyonight' then
  vim.cmd('colorscheme tokyonight')
end
