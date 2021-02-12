local MODES = { '', 'n', 'v', 'x', 's', 'o', '!', 'i', 'l', 'c', 't' }

local function valid_mode(mode)
  for _, m in ipairs(MODES) do
    if m == mode then
      return true
    end
  end
  return false
end

local function convert_mode(mode)
  if valid_mode(mode) then
    if mode == '' then
      return { 'n', 'v', 'o' }
    elseif mode == '!' then
      return { 'i', 'c' }
    else
      return { mode }
    end
  end
  error(string.format('Mapper: Invalid mode %s', mode))
end

local function valid_buffer(buffer)
  if vim.api.nvim_buf_is_valid(buffer) then
    return buffer
  end
  return nil
end

local function map(mappings)
  -- Wrap the mapping into a table so we can use it with unpack
  if type(mappings[1]) == 'string' then
    mappings = { mappings }
  end

  for _, mapping in ipairs(mappings) do
    local mode, lhs, rhs, opts = unpack(mapping)

    local modes = convert_mode(mode)

    assert(modes, 'Mapper: Invalid mode ' .. mode)
    assert(lhs and lhs ~= '', string.format('Mapper: Invalid left-hand side %s', lhs))

    rhs = rhs or '<NOP>'

    local buffer = nil
    if opts then
      buffer = valid_buffer(opts.buffer)

      if opts.buffer and not buffer then
        error(string.format('Mapper: Invalid buffer %s', buffer))
      end
      opts.buffer = nil

      opts.noremap = opts.noremap or false 
      opts.nowait = opts.nowait or false 
      opts.silent = opts.silent or false 
      opts.script = opts.script or false 
      opts.expr = opts.expr or false 
      opts.unique = opts.unique or false 
    end

    if buffer then
      for _, mode in ipairs(modes) do
        vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
      end
    else
      for _, mode in ipairs(modes) do
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
      end
    end
  end
end

return map
