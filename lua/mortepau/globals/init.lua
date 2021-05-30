-- Keep the global configuration if it exist, don't overwrite it
mortepau = mortepau or {}

-- Load buftype functionality
require('mortepau.globals.buftype')

-- Load file functionality
require('mortepau.globals.file')

-- Load editor functionality
require('mortepau.globals.editor')

-- Load quickfix enhancements
require('mortepau.globals.quickfix')

-- Load syntax related functionality
require('mortepau.globals.syntax')

-- Wrapper to vim.inspect any values, returns the inspected values
P = function(...)
  if select('#', ...) > 1 then
    print(vim.inspect({ ... }))
  else
    print(vim.inspect(...))
  end
  return ...
end

local function reload_single(term)
  for pack in pairs(package.loaded) do
    if pack:match('^' .. term .. '$') then
      package.loaded[pack] = nil
      return require(pack)
    end
  end
end

local function reload_matching(term)
  local freed = {}
  for pack in pairs(package.loaded) do
    if pack:match(term) then
      package.loaded[pack] = nil
      table.insert(freed, pack)
    end
  end

  for _, pack in pairs(freed) do
    require(pack)
  end
end

ReloadSingle = reload_single
Reload = reload_matching
R = R
