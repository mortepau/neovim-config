local M = {}

local config = {}

local function default_config()
  return {
    rename_prompt_text = '%s  ',
    rename_prompt_width = 19,
    rename_prompt_border = 'rounded',
    rename_cancel_keys = { '<Esc>', 'q' },
    rename_float_fg = 'NormalFloat',
    rename_float_bg = 'Boolean',
    rename_text_fg = 'Normal',
    rename_text_bg = 'Boolean',
  }
end

local function get_highlight(group, key)
  if vim.fn.hlexists(group) == 0 then return '' end

  local group_id = vim.fn.synIDtrans(vim.fn.hlID(group))

  local term = 'cterm'
  if vim.opt.termguicolors then term = 'gui' end
  local color = vim.fn.synIDattr(group_id, key, term)
  return color ~= '' and color or get_highlight('Normal', key)
end

function M.update(new_config)
  new_config = new_config or {}
  if type(new_config) ~= 'table' then
    error('Invalid type for config')
  end
  config = vim.tbl_extend('force', config, new_config)

  local term = vim.opt.termguicolors and 'gui' or 'cterm'
  if new_config.rename_text_fg  or new_config.rename_text_bg then
    vim.cmd(
      string.format('highlight LspuiRename %sfg=%s %sbg=%s',
        term,
        get_highlight(config.rename_text_fg, 'fg'),
        term,
        get_highlight(config.rename_text_bg, 'bg')
      )
    )
  end
  if new_config.rename_float_fg  or new_config.rename_float_bg then
    vim.cmd(
      string.format('highlight LspuiRenameBorder %sfg=%s %sbg=%s',
        term,
        get_highlight(config.rename_float_fg, 'fg'),
        term,
        get_highlight(config.rename_float_bg, 'bg')
      )
    )
  end
end

function M.get(key)
  return config[key]
end

M.update(default_config())

return M
