local Lightline = {}

function Lightline:init(opts)
  return
end

function Lightline:preload()
  vim.g.lightline = {
    colorscheme = 'Tomorrow_Night',
    active = {
      left = {
        { 'mode', 'paste' },
        { 'gitbranch', 'bufnum', 'filename', 'readonly', 'modified' }
      },
      right = {
        { 'percent', 'lineinfo' },
        { 'fileformat', 'fileencoding', 'filetype' },
        { 'diagnostics_error', 'diagnostics_warning', 'diagnostics_info', 'diagnostics_hint' }
      }
    },
    inactive = {
      left = {
        { 'filename' }
      },
      right = {
        { 'lineinfo' },
        { 'percent' }
      }
    },
    component = {
      bufnum = '#%n'
    },
    component_function = {
      gitbranch = 'StatuslineFugitive',
      readonly = 'StatuslineReadonly',
      modified = 'StatuslineModified',
      filetype = 'StatuslineFiletype',
      fileformat = 'StatuslineFileformat'
    },
    component_expand = {
      diagnostics_error = 'StatuslineDiagnosticsError',
      diagnostics_warning = 'StatuslineDiagnosticsWarning',
      diagnostics_info = 'StatuslineDiagnosticsInfo',
      diagnostics_hint = 'StatuslineDiagnosticsHint'
    },
    component_function_visible_condition = {
      diagnostics_error = 'StatuslineDiagnosticsErrorVisible',
      diagnostics_warning = 'StatuslineDiagnosticsWarningVisible',
      diagnostics_info = 'StatuslineDiagnosticsInfoVisible',
      diagnostics_hint = 'StatuslineDiagnosticsHintVisible'
    },
    mode_map = {
      ['n'] = 'NORMAL',
      ['i'] = 'INSERT',
      ['v'] = 'VISUAL',
      ['V'] = 'V-LINE',
      ['\\<C-V>'] = 'V-BLOCK',
      ['R'] = 'REPLACE',
      ['c'] = 'COMMAND',
      ['s'] = 'SELECT',
      ['S'] = 'S-LINE',
      ['\\<C-S>'] = 'S-BLOCK',
      ['t'] = 'TERMINAL'
    }
  }
end

function Lightline:load()
  vim.cmd('packadd lightline.vim')
  vim.cmd('packadd lightline-gruvbox.vim')
end

function Lightline:postload()
  return
end

return Lightline
