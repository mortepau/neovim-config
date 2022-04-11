---Wrapper to vim.inspect any values
---@vararg any @The variables to inspect
---@return any @The inspected variables
function P(...)
  if select('#', ...) > 1 then
    print(vim.inspect({ ... }))
  else
    print(vim.inspect(...))
  end
  return ...
end

---Short-hand for replacing terminal codes in `term`
---@param term string @The term to replace terminal codes in
---@return string @`term` with the terminal codes replaced
function t(term)
  return vim.api.nvim_replace_termcodes(term, true, true, true)
end

---Reloads the package matching `term` and return it
---@param term string @The package to reload
---@return any @The content of the package `term`
function Reload(term)
  for pack in pairs(package.loaded) do
    if pack:match('^' .. term .. '$') then
      package.loaded[pack] = nil
      return require(pack)
    end
  end
end

---Reloads all packages containing `term`
---@param term string @The term to match package names to
function ReloadMultiple(term)
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

function HighlightGet(group)
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

function HighlightFormat(name, highlight)
  local prefix = vim.o.termguicolors == 1 and 'gui' or 'cterm'
  local s = ''

  -- Move the highlight definition from name, if no name is provided
  if not highlight then
    highlight = name
  else
    s = name .. ' '
  end

  if highlight.attribute and #highlight.attribute > 0 then
    s = s .. prefix .. '=' .. table.concat(highlight.attribute, ',') .. ' '
  end

  for color_name, color in pairs(highlight.color) do
    s = s .. color_name .. '=' .. color .. ' '
  end

  s = s:sub(1, -2)

  return s
end

function ToggleSpell()
  if vim.api.nvim_win_get_option(0, 'spell') then
    vim.opt.spell = false
    print('Spelling disabled')
  else
    vim.opt.spell = true
    vim.opt.spelllang = 'en'
    print('Spelling enabled, spelllang is set to "en"')
  end
end

-- Create commands for easier use
vim.cmd([[command! -nargs=0 ToggleSpell lua ToggleSpell()]])
vim.cmd([[command! -nargs=1 Reload call luaeval("Reload(_A)", <f-args>)]])
