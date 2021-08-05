local M = {}

-- For requires that return tables
function M.require(pack)
  return setmetatable({}, {
    __index = function(_, key)
      return require(pack)[key]
    end,
    __newindex = function(_, key, value)
      require(pack)[key] = value
    end,
  })
end

-- For requires that return functions
function M.require_call(pack)
  return setmetatable({}, {
    __call = function(_, ...)
      return require(pack)(...)
    end,
  })
end

--[[
  local lazy_table = lazy.require_deep_call('some_module')
  local lazy_func = lazy_table.slow_function
  print(lazy_func(1, 2, 3))
--]]
function M.require_deep_call(pack)
  return setmetatable({}, {
    __index = function(_, k)
      return function(...)
        return require(pack)[k](...)
      end
    end,
  })
end

return M
