mortepau.syntax = mortepau.syntax or {}

function mortepau.syntax.stack()
  if not vim.fn.exists('*synstack') then
    return
  end

  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  local synstack = vim.fn.synstack(line, col+1)
  return vim.tbl_map(function(v) return vim.fn.synIDattr(v, 'name') end, synstack)
end

function mortepau.syntax.get_highlight(group)
  if vim.fn.hlexists(group) == 0 then return {} end

  local highlights = { color = {}, attribute = {}}
  local colors = {
    'fg',
    'bg',
    'sp',
  }
  local attributes = {
    'bold',
    'italic',
    'inverse',
    'standout',
    'underline',
    'strikethrough'
  }

  local synIDattr = vim.fn.synIDattr
  local group_id = vim.fn.synIDtrans(vim.fn.hlID(group))

  for _, color in ipairs(colors) do
    local gui_color = synIDattr(group_id, color, 'gui')
    local cterm_color = synIDattr(group_id, color, 'cterm')
    highlights.color['gui' .. color] = gui_color ~= '' and gui_color or nil
    highlights.color['cterm' .. color] = cterm_color ~= '' and cterm_color or nil
  end

  for _, attribute in ipairs(attributes) do
    highlights.attribute[attribute] = synIDattr(group_id, attribute) == 1 and true or nil
  end

  return highlights
end

function mortepau.syntax.format_highlight(name, highlight)
  local prefix = vim.o.termguicolors == 1 and 'gui' or 'cterm'
  local s = ''

  -- Move the highlight definition from name, if no name is provided
  if not highlight then
    highlight = name
  else
    s = name .. ' '
  end

  if #highlight.attribute > 0 then
    s = s .. prefix .. '=' .. table.concat(highlight.attribute, ',') .. ' '
  end

  for name, color in pairs(highlight.color) do
    s = s .. name .. '=' .. color .. ' '
  end

  s = s:sub(1, -2)

  return s
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
