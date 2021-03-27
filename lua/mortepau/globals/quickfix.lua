mortepau.quickfix = mortepau.quickfix or {}

function mortepau.quickfix.toggle()
  local wins = vim.api.nvim_list_wins()

  local qf_win_exist = #vim.tbl_filter(function(win) return vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'qf' end, wins) > 0

  if qf_win_exist then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

function mortepau.quickfix.empty()
  vim.fn.setqflist({})
end

function mortepau.quickfix.diagnostics()
  local diagnostics = {
    { bufnr = 90, lnum = 9, col = 4, type = 'E', text = 'Diagnostics' },
    { bufnr = 90, lnum = 10, col = 5, type = 'E', text = 'Diagnostics' },
    { bufnr = 90, lnum = 12, col = 4, type = 'E', text = 'Diagnostics' },
  }
  vim.fn.setqflist(diagnostics)
end
