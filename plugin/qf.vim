function! s:PopulateQF(func) abort
    let list = function(a:func)()
    if len(list) == 0
        echom "Empty list"
        return
    endif
    call setqflist(list, 'r')
    echom "Quickfix window populated"
endfunction

command! -nargs=1 PopulateQF call <SID>PopulateQF(<f-args>)

function! s:ToggleQF() abort
    let qf_open = filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')

    if qf_open != []
        :cclose
        return
    endif
    :copen
endfunction

command! ToggleQF call <SID>ToggleQF()
