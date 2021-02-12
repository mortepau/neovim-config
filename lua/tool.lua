
local tool = {}

-- TODO: Check out sideways.vim

tool.fuzzyfinder = {
  choices = {
    {
      cmd = 'fzf %s -- "%s" %s',
      name = 'fzf',
      flags = '',
      path = '$PWD'
    }
  },
  prog = nil,
  cmd = nil
}

tool.grep = {
  choices = {
    {
      name = 'rg',
      cmd = 'rg %s -- "%s" %s',
      flags = '-smart-case --hidden --line-buffered --vimgrep --color=auto',
      path = '$PWD'
    },
    {
      name = 'ripgrep',
      cmd = 'ripgrep %s -- "%s" %s',
      flags = '-smart-case --hidden --line-buffered --vimgrep --color=auto',
      path = '$PWD'
    },
    {
      name = 'ag',
      cmd = 'ag %s -- "%s" %s',
      flags = '',
      path = '$PWD'
    },
    {
      name = 'ack',
      cmd = 'ack %s -- "%s" %s',
      flags = '',
      path = '$PWD'
    },
    {
      name = 'grep',
      cmd = 'grep %s -- "%s" %s',
      flags = '--recursive --line-number --line-buffered --color=auto',
      path = '$PWD'
    },
  },
  prog = nil,
  cmd = nil
}

tool.find = {
  choices = {
    {
      name = 'fd',
      cmd = '',
        flags = ''
    },
    {
      name = 'fdfind',
      cmd = '',
        flags = ''
    },
    {
      name = 'find',
      cmd = '',
        flags = ''
    }
  },
  prog = nil,
  cmd = nil
}

tool.preview = {
  choices = {
    {
      name = 'bat',
      cmd = 'bat %s -- %s',
      flags = '--color=auto --theme=OneHalfDark --style=number'
    },
    {
      name = 'batcat',
      cmd = 'batcat %s -- %s',
      flags = '--color=auto --theme=OneHalfDark --style=number'
    },
    {
      name = 'cat',
      cmd = 'cat %s -- %s',
      flags = '-n -s',
    },
  },
  prog = nil,
  cmd = nil
}

for _, tool_config in pairs(tool) do
  for _, t in ipairs(tool_config.choices) do
    if vim.fn.executable(t.name) then
      tool_config.prog = t.name
      tool_config.cmd = string.format(t.cmd, t.flags, '%s', '%s')
      break
    end
  end
end

return tool
