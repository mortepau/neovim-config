local system = require('system')

local Packer = {}

-- Convert the name into a path in the plugin directory if it exists
-- otherwise use the repository given by system.git_name
local function format_local_plugin(name)
  local dir = system.plugin_dir .. system.path_separator .. name
  if vim.fn.isdirectory(vim.fn.expand(dir)) == 1 then
    return dir
  else
    return system.git_name .. '/' .. name
  end
end

-- Convert the list of required plugins into a list of plugin configurations
local function format_required_plugins(required_plugins, plugin_configs)
  local formatted_plugins = {}
  for _, name in ipairs(required_plugins) do
    local config = vim.tbl_filter(function(v) return v[1] == name end, plugin_configs)
    -- Insert first element, as vim.tbl_filter wraps it in a table even when
    -- there is only a single match
    table.insert(formatted_plugins, config[1])
  end
  return formatted_plugins
end

function Packer:init(opts)
  -- Load or install packer.nvim
  Packer:install()

  if not self.installed then
    return
  end

  -- If not initialized, initialize it
  if self.packer == nil then
    self.packer = require('packer')
    self.packer.init({
      package_root = system.package_dir,
      compile_path = system.config_dir .. system.path_separator .. 'plugin' .. system.path_separator .. 'packer_compiled.vim',
      plugin_package = 'packer',
      -- display = {
      --   open_fn = function(name)
      --     local ok, float_win = pcall(function()
      --       return require('plenary.window.float').percentage_range_window(0.8, 0.8)
      --     end)

      --     if not ok then
      --       vim.cmd('65vnew [packer]')

      --       return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
      --     end

      --     local bufnr = float_win.buf
      --     local win = float_win.win

      --     vim.api.nvim_buf_set_name(bufnr, name)
      --     vim.api.nvim_win_set_option(win, 'winblend', 10)

      --     return win, bufnr
      --   end
      -- }
    })
  end

end

-- Load all plugins in use and format them to match packer.nvim's format
function Packer:load_plugins()
  -- Load all the plugins from the plugin file
  local all_plugins = require('plugins')
  local required = vim.tbl_filter(function(v) return v.required end, all_plugins)
  local plugins = vim.tbl_filter(function(v) return not v.required end, all_plugins)

  required = vim.tbl_map(function(v)
    -- Remove the required key
    v.required = nil

    v[1] = v.name
    v.name = nil

    return v
  end, required)

  self.plugins = vim.tbl_map(function(v)
    -- Insert path to plugin directory if it is a local plugin
    if v.local_plugin then
      v.name = format_local_plugin(v.name)
    end
    -- Move the name element to the first position
    v[1] = v.name
    v.name = nil

    -- If the requires key exists substitute all names with their config instead
    if v.requires then
      v.requires = format_required_plugins(v.requires, required)
    end

    return v
  end, plugins)
end

-- Ask the user to install packer.nvim if not installed 
function Packer:install(directory)
  local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

  if packer_exists then
    self.installed = true
    return
  end

  if vim.fn.input("Download Packer? (y for yes): ") ~= 'y' then
    self.installed = false
    return
  end

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print('Downloading packer.nvim')

  self.installed = true
end

-- Add all plugins to packpath and configure packer.nvim
function Packer:preload()
  if self.preloaded then
    return
  end

  -- Reset, in case we resource file
  self.packer.reset()

  -- Load all plugins
  self.packer.use(self.plugins)

  self.preloaded = true
end

-- Load all of the start plugins
function Packer:load()
  if self.loaded then
    return
  end

  vim.cmd('packloadall')

  self.loaded = true
end

-- After loading all of the start plugins and packer.nvim
-- define a few commands to interact with the plugin manager
function Packer:postload()
  if self.postloaded then
    return
  end

  vim.cmd('command! -nargs=0 PackerCompile lua require("external.plugin.packer").packer.compile()<CR>')
  vim.cmd('command! -nargs=0 PackerInstall lua require("external.plugin.packer").packer.install()<CR>')
  vim.cmd('command! -nargs=0 PackerUpdate lua require("external.plugin.packer").packer.update()<CR>')
  vim.cmd('command! -nargs=0 PackerSync lua require("external.plugin.packer").packer.sync()<CR>')
  vim.cmd('command! -nargs=0 PackerClean lua require("external.plugin.packer").packer.clean()<CR>')

  self.postloaded = true
end

-- Reset the plugins so that you can rerun it without errors
function Packer:reset()
  -- Reset all the status flags
  self.preloaded = nil
  self.loaded = nil
  self.postloaded = nil
  
  -- Unset the plugins table
  self.plugins = nil

  -- Unload packer.nvim
  self.packer = nil
  if package.loaded['packer.nvim'] then
    package.loaded['packer.nvim'] = nil
  end

  -- Unload this package
  if package.loaded['external.plugin.packer'] then
    package.loaded['external.plugin.packer'] = nil
  end
end

function Packer:reload()
  Packer:reset()

  Packer:load_plugins()

  Packer:preload()

  Packer:load()

  Packer:postload()
end

Packer:load_plugins()

return Packer
