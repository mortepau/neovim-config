local autocommands = {}

function autocommands:load()
  self.augroups = {
    -- Use relative numbers when inside buffer and not in insert mode
    NumberToggle = {
      { event = { 'BufEnter', 'FocusGained', 'InsertLeave' }, pat = '*', cmd = 'if &filetype !=# \'help\' | set relativenumber | endif' },
      { event = { 'BufLeave', 'FocusLost', 'InsertEnter' }, pat = '*', cmd = 'if &filetype !=# \'help\' | set norelativenumber | endif' }
    },
    -- Use cursorline when not in insert mode
    CursorLineToggle = {
      { event = 'InsertEnter', pat = '*', cmd = 'set nocursorline' },
      { event = 'InsertLeave', pat = '*', cmd = 'set cursorline' }
    },
    -- Return to last edit position when opening filees
    FindPosition = {
      { event = 'BufReadPost', pat = '*', cmd = 'if line("\'\\"") > 1 && line("\'\\"") <= line("$") | execute "normal! g\'\\"" | endif' }
    },
    -- Force checktime when focusing or entering buffer
    ManualChecktime = {
      { event = { 'FocusGained', 'BufEnter' }, pat = '*', cmd = 'if getcmdwintype() == "" | checktime | endif' }
    },
    -- Highlight yanked text
    YankHighlight = {
      { event = 'TextYankPost', pat = '*', cmd = 'silent! lua require(\'vim.highlight\').on_yank("IncSearch", 500, vim.v.event)' }
    },
    -- Clean excess whitespace
    CleanWhitespace = {
      { event = 'BufWritePre', pat = { '*.txt', '*.js', '*.py', '*.sh' }, cmd = ':silent! lua require(\'utils.functions\').clean_whitespace()' },
      { event = 'FileType', pat = 'json', cmd = ':silent! lua require(\'utils.functions\').highlight_whitespace()' },
    },
    -- Rebind escape in some terminals
    TerminalEscape = {
      { event = 'TermEnter', pat = 'term://*', cmd = 'lua require(\'utils.functions\').terminal_escape()' },
    },
    -- Configure help window
    HelpWindow = {
      { event = 'BufEnter', pat = '*.txt', cmd = 'lua require(\'utils.functions\').configure_help()' }
    }
  }
end

function autocommands:set()
  local autocmd = require('utils.autocmd')
  autocmd(self.augroups)
end

autocommands:load()

return autocommands
