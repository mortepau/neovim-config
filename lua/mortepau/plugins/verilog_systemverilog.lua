vim.augroup('SystemVerilogBindings', {
  {
    'FileType',
    { 'verilog', 'systemverilog', 'verilog_systemverilog' },
    'nnoremap <buffer> <leader>i :VerilogFollowInstance<Cr>'
  },
  {
    'FileType',
    { 'verilog', 'systemverilog', 'verilog_systemverilog' },
    'nnoremap <buffer> <leader>I :VerilogFollowPort<Cr>'
  },
  {
    'FileType',
    { 'verilog', 'systemverilog', 'verilog_systemverilog' },
    'nnoremap <buffer> <leader>u :VerilogGotoInstanceStart<Cr>'
  },
})
