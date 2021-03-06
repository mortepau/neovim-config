local M = {}

local MODE = {
  NORMAL_VISUAL_OPERATOR = '',
  NORMAL                 = 'n',
  OPERATOR               = 'o',
  VISUAL                 = 'x',
  SELECT                 = 's',
  VISUAL_SELECT          = 'v',
  INSERT                 = 'i',
  COMMAND                = 'c',
  INSERT_COMMAND         = '!',
  INSERT_COMMAND_LANG    = 'l',
  TERMINAL               = 't',
}

mortepau.mappings = mortepau.mappings or {}

local id = 0
local function next_id()
  id = id + 1
  return id
end

local function function_to_id(mode, rhs)
  local mapid = next_id()
  local prefix
  if mode == 'i' then
    prefix = '<cmd>'
  elseif mode == 'v' then
    prefix = ':<C-u>'
  else
    prefix = ':'
  end

  if type(rhs) == 'table' then
    local func = rhs[1]
    table.remove(rhs, 1)
    local params = rhs
    mortepau.mappings[mapid] = { func, params }
  else
    mortepau.mappings[mapid] = { rhs, {} }
  end

  return string.format(
    '%slua mortepau.execute_mapping(%d)<CR>',
    prefix,
    mapid
  )
end

function mortepau.execute_mapping(mapid)
  if not mortepau.mappings[mapid] then
    vim.notify('Mapping: An error occured (id: ' .. tostring(mapid) .. ')')
    return
  end

  local rhs = vim.deepcopy(mortepau.mappings[mapid])
  local func, params = unpack(rhs)

  func(unpack(params))
end

local function _map(mode, lhs, rhs, opts)
  if type(rhs) == 'function' or type(rhs) == 'table' then
    rhs = function_to_id(mode, rhs)
  end
  if opts.buffer then
    local buffer = opts.buffer
    opts.buffer = nil
    vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

-- Recursive mappings

function M.map(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.NORMAL_VISUAL_OPERATOR, lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.NORMAL, lhs, rhs, opts)
end

function M.vmap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.VISUAL_SELECT, lhs, rhs, opts)
end

function M.xmap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.VISUAL, lhs, rhs, opts)
end

function M.smap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.SELECT, lhs, rhs, opts)
end

function M.omap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.OPERATOR, lhs, rhs, opts)
end

-- Using 'ic' instead of '!' as a workaround
function M.icmap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.INSERT_COMMAND, lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.INSERT, lhs, rhs, opts)
end

function M.cmap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.COMMAND, lhs, rhs, opts)
end

function M.lmap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.INSERT_COMMAND_LANG, lhs, rhs, opts)
end

function M.tmap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = nil
  _map(MODE.TERMINAL, lhs, rhs, opts)
end

-- Non-recursive mappings

function M.noremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.NORMAL_VISUAL_OPERATOR, lhs, rhs, opts)
end

function M.nnoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.NORMAL, lhs, rhs, opts)
end

function M.vnoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.VISUAL_SELECT, lhs, rhs, opts)
end

function M.xnoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.VISUAL, lhs, rhs, opts)
end

function M.snoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.SELECT, lhs, rhs, opts)
end

function M.onoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.OPERATOR, lhs, rhs, opts)
end

-- Using 'ic' instead of '!' as a workaround
function M.icnoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.INSERT_COMMAND, lhs, rhs, opts)
end

function M.inoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.INSERT, lhs, rhs, opts)
end

function M.cnoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.COMMAND, lhs, rhs, opts)
end

function M.lnoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.INSERT_COMMAND_LANG, lhs, rhs, opts)
end

function M.tnoremap(lhs, rhs, opts)
  opts = vim.deepcopy(opts) or {}
  opts.noremap = true
  _map(MODE.TERMINAL, lhs, rhs, opts)
end

return M
