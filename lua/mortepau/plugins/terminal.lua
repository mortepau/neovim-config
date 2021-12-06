local terminal = require('terminal')
terminal.setup({
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

local prefix = '<leader>t'

local cmds = {
  K = 'top',
  k = 'above',
  J = 'bot',
  j = 'below',
  h = 'lhs',
  H = 'left',
  l = 'rhs',
  L = 'right',
  f = 'float',
  c = 'current',
  T = 'tab',
}

for suffix, position in pairs(cmds) do
  vim.nnoremap(prefix .. suffix, function() terminal.open({ position = position }) end, { silent = true })
end
vim.nnoremap(prefix .. 't', function() terminal.toggle() end, { silent = true })
