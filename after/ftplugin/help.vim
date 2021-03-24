
setlocal number
setlocal norelativenumber

augroup HelpCursorline
    autocmd!
    autocmd BufEnter <buffer> setlocal cursorline
    autocmd BufLeave <buffer> setlocal nocursorline
augroup END

nnoremap <buffer> q <cmd>q<cr>
