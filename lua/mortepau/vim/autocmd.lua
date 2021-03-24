local M = {}

function M.autocmd(event, pat_or_buf, cmd, opts)
  opts = opts or {}

  local parts = { 'autocmd' }

  if opts.group then
    table.insert(parts, opts.group)
  end

  if type(event) == 'table' then
    event = table.concat(event, ',')
  end
  table.insert(parts, event)

  if type(pat_or_buf) == 'table' then
    pat_or_buf = table.concat(pat_or_buf, ',')
  elseif type(pat_or_buf) == 'number' then
    if pat_or_buf == 0 then
      pat_or_buf = '<buffer>'
    else
      pat_or_buf = '<buffer=' .. tostring(pat_or_buf) .. '>'
    end
  end
  table.insert(parts, pat_or_buf)

  if opts.once then
    table.insert(parts, '++once')
  end

  if opts.nested then
    table.insert(parts, '++nested')
  end

  table.insert(parts, cmd)

  vim.cmd(table.concat(parts, ' '))
end

function M.augroup(group, definitions)
  vim.cmd('augroup ' .. group)
  vim.cmd('autocmd!')

  -- Check if the cmd parameter is a string
  if  #definitions > 2 and type(definitions[3]) == 'string' then
    M.autocmd(unpack(definitions))
  else
    for _, definition in ipairs(definitions) do
      M.autocmd(unpack(definition))
    end
  end

  vim.cmd('augroup END')
end

return M
