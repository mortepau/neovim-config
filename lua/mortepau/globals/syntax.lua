mortepau.syntax = mortepau.syntax or {}

function mortepau.syntax.stack()
  if not vim.fn.exists('*synstack') then
    return
  end

  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  local synstack = vim.fn.synstack(line, col+1)
  return vim.tbl_map(function(v) return vim.fn.synIDattr(v, 'name') end, synstack)
end

function mortepau.syntax.highlight_whitespace()
  local group_name = 'HighlightWhitespace'
  if vim.fn.exists('#' .. group_name) then
    vim.cmd('augroup! ' .. group_name)
  else
    vim.augroup(group_name, {
      { 'InsertEnter', '*', 'match ErrorMsg /\\s\\+\\%#\\@<!$/', { buffer = 0 } },
      { 'InsertLeave', '*', 'match ErrorMsg /\\s\\+$/', { buffer = 0 } },
    })
  end
end
