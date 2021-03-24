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

local function _map(mode, lhs, rhs, opts)
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
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.NORMAL_VISUAL_OPERATOR, lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.NORMAL, lhs, rhs, opts)
end

function M.vmap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.VISUAL_SELECT, lhs, rhs, opts)
end

function M.xmap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.VISUAL, lhs, rhs, opts)
end

function M.smap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.SELECT, lhs, rhs, opts)
end

function M.omap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.OPERATOR, lhs, rhs, opts)
end

-- Using 'ic' instead of '!' as a workaround
function M.icmap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.INSERT_COMMAND, lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.INSERT, lhs, rhs, opts)
end

function M.cmap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.COMMAND, lhs, rhs, opts)
end

function M.lmap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.INSERT_COMMAND_LANG, lhs, rhs, opts)
end

function M.tmap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = nil
  _map(MODE.TERMINAL, lhs, rhs, opts)
end

-- Non-recursive mappings

function M.noremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.NORMAL_VISUAL_OPERATOR, lhs, rhs, opts)
end

function M.nnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.NORMAL, lhs, rhs, opts)
end

function M.vnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.VISUAL_SELECT, lhs, rhs, opts)
end

function M.xnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.VISUAL, lhs, rhs, opts)
end

function M.snoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.SELECT, lhs, rhs, opts)
end

function M.onoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.OPERATOR, lhs, rhs, opts)
end

-- Using 'ic' instead of '!' as a workaround
function M.icnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.INSERT_COMMAND, lhs, rhs, opts)
end

function M.inoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.INSERT, lhs, rhs, opts)
end

function M.cnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.COMMAND, lhs, rhs, opts)
end

function M.lnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.INSERT_COMMAND_LANG, lhs, rhs, opts)
end

function M.tnoremap(lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = true
  _map(MODE.TERMINAL, lhs, rhs, opts)
end

return M
