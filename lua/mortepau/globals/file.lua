mortepau.file = mortepau.file or {}

function mortepau.file.source(filename)
  if filename:sub(1) == '%' then filename = vim.fn.expand(filename) end
  local is_lua = not not string.find(filename, '.lua$')
  local is_vim = not not string.find(filename, '.vim$')

  if is_lua then
    vim.cmd('luafile ' .. filename)
  elseif is_vim then
    vim.cmd('source ' .. filename)
  end
end

function mortepau.file.clean_whitespace()
  local cursor = vim.fn.getpos('.')
  local old_query = vim.fn.getreg('/')
  vim.cmd('silent! %s/\\s\\+$//e')
  vim.fn.setpos('.', cursor)
  vim.fn.setreg('/', old_query)
end
