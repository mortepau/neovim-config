mortepau.quickfix = mortepau.quickfix or {}

function mortepau.quickfix.toggle()
  local wins = vim.api.nvim_list_wins()

  local qf_win_exist = #vim.tbl_filter(function(win) return vim.wo[win].filetype == 'qf' end, wins) > 0

  if qf_win_exist then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end
