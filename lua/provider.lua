local remote = {}
local tools = {}

-- TODO: Add possible providers for fzf, ripgrep, ack, ag, ...
-- TODO: Add parameter to set grepprg friendly string
-- TODO: Add parameter to set grepformat friendly string
-- TODO: Fix flags for fzf, ag and ack
-- Divide into groups:
-- grep: rg, ag, grep
-- picker: fzf, other similar ones
-- preview: bat, cat
-- diff: delta, git

--[[
install pyenv: github.com/pyenv/pyenv
install pyenv-virtualenv: github.com/pyenv/pyenv-virtualenv

pyenv install <python2-version>
pyenv install <python3-version>

pyenv activate neovim2
pip install pynvim

pyenv activate neovim3
pip install pynvim flake8
ln -s `pyenv which flake8` $HOME/.bin/flake8

install asdf github.com/asdf-vm/asdf

asdf plugin-add nodejs
asdf plugin-add ruby

asdf install nodejs latest
asdf install ruby latest

asdf global nodejs <nodejs-version>
asdf global ruby <ruby-version>
]]

-- Substitute ${version} for the input parameter version
-- and expand all environment variables and other path stuff
local function escape(path, version)
  path = vim.fn.substitute(path, '${version}', version, '')
  path = vim.fn.expand(path)
  return path
end

remote.perl = {
  use = false,
  version = nil,
  choices = {
    '/usr/local/bin/perl',
    '/usr/bin/perl',
    ''
  },
  prog = nil
}

remote.ruby = {
  use = false,
  version = nil,
  choices = {
    '$HOME/.asdf/installs/ruby/${version}/bin/ruby',
    '/usr/local/bin/ruby',
    '/usr/bin/ruby',
    ''
  },
  prog = nil
}

remote.node = {
  use = false,
  version = "14.13.1",
  choices = {
    '$HOME/.asdf/installs/nodejs/${version}/bin/node',
    '/usr/bin/node',
    '/usr/local/bin/node',
    ''
  },
  prog = nil
}

remote.python = {
  use = true,
  version = "2.7.18",
  choices = {
    '$HOME/.pyenv/versions/neovim2/bin/python',
    '$HOME/.pyenv/versions/${version}/bin/python',
    '$HOME/.asdf/installs/python/${version}/bin/python',
    '/usr/local/bin/python2',
    '/usr/bin/python2',
    ''
  },
  prog = nil
}

remote.python3 = {
  use = true,
  version = "3.8.5",
  choices = {
    '$HOME/.pyenv/versions/neovim3/bin/python',
    '$HOME/.pyenv/versions/${version}/bin/python',
    '$HOME/.asdf/installs/python/${version}/bin/python3',
    '/usr/local/bin/python3',
    '/usr/bin/python3',
    ''
  },
  prog = nil
}

tools.finder = {
  choices = {
    'fd',
    'fdfind',
    'find'
  },
  options = {
    fd = function(search, flags, path)
      local format = 'fd %s -- "%s" %s'

      local default_flags = '--hidden --follow --exclude ".git" --exclude "node_modules"'
      local default_path = vim.cmd('pwd')
      local default_search = '.*'

      return string.format(
        format,
        flags or default_flags,
        search or default_search,
        path or default_path
      )
    end,
    fdfind = function(search, flags, path)
      local format = 'fdfind %s -- "%s" %s'

      local default_flags = '--hidden --follow --exclude ".git" --exclude "node_modules"'
      local default_path = vim.cmd('pwd')
      local default_search = '.*'

      return string.format(
        format,
        flags or default_flags,
        search or default_search,
        path or default_path
      )
    end,
    find = function(search, flags, path)
      local format = 'find "%s" %s -regex ".*%s.*"'

      local default_flags = ''
      local default_path = vim.cmd('pwd')
      local default_search = '.*'

      return string.format(
        format,
        path or default_path,
        flags or default_flags,
        search or default_search
      )
    end
  },
  prog = nil,
  cmd = nil
}

tools.grepper = {
  choices = {
    'rg',
    'ripgrep',
    'ag',
    'ack',
    'grep'
  },
  options = {
    rg = function(search, flags, path)
      local format = 'rg %s -- "%s" %s'

      local default_flags = '-smart-case --hidden --line-buffered --vimgrep --color=auto'
      local default_path = vim.cmd('pwd')
      local default_search = '*'

      return string.format(
        format,
        flags or default_flags,
        search or default_search,
        path or default_path
      )
    end,
    ripgrep = function(search, flags, path)
      local format = 'ripgrep %s -- "%s" %s'

      local default_flags = '-smart-case --hidden --line-buffered --vimgrep --color=auto'
      local default_path = vim.cmd('pwd')
      local default_search = '*'

      return string.format(
        format,
        flags or default_flags,
        search or default_search,
        path or default_path
      )
    end,
    ag = function(search, flags, path)
      local format = 'ag %s -- "%s" %s'

      local default_flags = ''
      local default_path = vim.cmd('pwd')
      local default_search = '*'

      return string.format(
        format,
        flags or default_flags,
        path or default_path,
        search or default_search
      )
    end,
    ack = function(search, flags, path)
      local format = 'ack %s -- "%s" %s'

      local default_flags = ''
      local default_path = vim.cmd('pwd')
      local default_search = '*'

      return string.format(
        format,
        flags or default_flags,
        search or default_search,
        path or default_path
      )
    end,
    grep = function(search, flags, path)
      local format = 'grep %s -- "%s" %s'

      local default_flags = '--recursive --line-number --line-buffered --color=auto'
      local default_path = vim.cmd('pwd')
      local default_search = '*'

      return string.format(
        format,
        flags or default_flags,
        search or default_search,
        path or default_path
      )
    end
  },
  prog = nil,
  cmd = nil
}

tools.filter = {
  choices = {
    'fzf'
  },
  options = {
    fzf = function(search, flags, path)
      local format = 'fzf %s -- "%s"'

      local default_flags = ''
      local default_path = vim.cmd('pwd')
      local default_search = '*'

      return string.format(
        format,
        flags or default_flags,
        path or default_path,
        search or default_search
      )
    end
  },
  prog = nil,
  cmd = nil
}

tools.previewer = {
  choices = {
    'bat',
    'batcat',
    'cat'
  },
  options = {
    bat = function(search, flags)
      local format = 'bat %s -- %s'
      local default_flags = '--color=auto --theme=gruvbox --style=number'

      return string.format(
        format,
        flags or default_flags,
        search
      )
    end,
    batcat = function(search, flags)
      local format = 'batcat %s -- %s'

      local default_flags = '--color=auto --theme=gruvbox --style=number'

      return string.format(
        format,
        flags or default_flags,
        search
      )
    end,
    cat = function(search, flags)
      local format = 'cat %s -- %s'

      local default_flags = '-n -s'

      return string.format(
        format,
        flags or default_flags,
        search
      )
    end
  },
  prog = nil,
  cmd = nil
}

-- Iterate over each remote provider
for lang, opts in pairs(remote) do
  local full_path
  -- Iterate over the possible paths to prog
  for _, path in ipairs(opts.choices) do
    full_path = escape(path, opts.version)
    -- The prog is executable, use this one
    if vim.fn.executable(full_path) == 1 then
      opts.prog = full_path
      break
    end
  end

  -- Set <lang>_host_prog to the found prog or disable it if not found
  if opts.use and opts.prog then
    vim.g[lang .. '_host_prog'] = opts.prog
  elseif not opts.use or not opts.prog then
    vim.g['loaded_' .. lang .. '_provider'] = 0
  end
end


for _, tool in pairs(tools) do
  for _, choice in ipairs(tool.choices) do
    if vim.fn.executable(choice) then
      tool.prog = tool.options[choice]
      break
    end
  end
end

return {
  remote = remote,
  tools = tools
}
