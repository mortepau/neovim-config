local System = {}

function System:load()
  -- What system are we using
  self.is_mac = jit.os == 'OSX'
  self.is_linux = jit.os == 'Linux'
  self.is_windows = jit.os == 'Windows'

  self.system_name = (self.is_mac and 'macOS') or (self.is_linux and 'Linux') or (self.is_windows and 'Windows')

  -- What shell are we running
  -- NOTE: Might not work if running another shell manually. Should then use
  --       'ps -p "$$"', but this seems to not work from inside (Neo)Vim.
  self.is_bash = os.getenv('SHELL') == '/bin/bash'
  self.is_zsh = os.getenv('SHELL') == '/bin/zsh'

  -- Are we running inside type of environment
  self.is_wsl = not not ( os.getenv('IS_WSL') or os.getenv('WSL_DISTRO_NAME') )
  self.is_tmux = not not os.getenv('TMUX')

  -- Variables controlled by shell
  self.has_nerdfont = not not os.getenv('USE_NERDFONT')
  self.at_work = not not os.getenv('AT_WORK')

  -- Language plugin providers
  self.has_pyenv = not not os.getenv('PYENV_ROOT')
  self.has_asdf = not not os.getenv('ASDF_DIR')

  -- Path separator, must be set after is_windows as it depends on that variable
  self.path_separator = self.is_windows and '\\' or '/'

  -- Useful paths
  self.home = os.getenv('HOME')
  self.config_dir = vim.fn.stdpath('config')
  self.data_dir = vim.fn.stdpath('data')
  self.plugin_dir = self.home .. self.path_separator .. 'plugins'
  self.package_dir = self.data_dir .. self.path_separator .. 'site' .. self.path_separator .. 'pack'
  self.pyenv_dir = os.getenv('PYENV_ROOT')
  self.asdf_dir = os.getenv('ASDF_DIR')

  -- Git username
  self.git_name = 'mortepau'
end

System:load()

return System
