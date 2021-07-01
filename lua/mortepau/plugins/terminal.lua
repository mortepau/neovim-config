require('terminal').setup({
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
