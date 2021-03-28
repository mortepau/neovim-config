" Indent text object
function! s:indent_textobj(inner)
    if getline('.') =~ '^\s*$'
        let ln_start = s:detect_nearest_line()
        let ln_end = ln_start
    else
        let ln_start = line('.')
        let ln_end = ln_start
    endif

    let indent = indent(ln_start)
    if indent > 0
        while indent(ln_start) >= indent && ln_start > 0
            let ln_start = prevnonblank(ln_start-1)
        endwhile

        while indent(ln_end) >= indent && ln_end <= line('$')
            let ln_end = s:nextnonblank(ln_end+1)
        endwhile
    else
        while indent(ln_start) == 0 && ln_start > 0 && getline(ln_start) !~ '^\s*$'
            let ln_start -= 1
        endwhile

        while indent(ln_start) > 0 && ln_start > 0
            let ln_start = prevnonblank(ln_start-1)
        endwhile

        while indent(ln_start) == 0 && ln_start > 0 && getline(ln_start) !~ '^\s*$'
            let ln_start -= 1
        endwhile

        while indent(ln_end) == 0 && ln_end <= line('$') && getline(ln_end) !~ '^\s*$'
            let ln_end += 1
        endwhile

        while indent(ln_end) > 0 && ln_end <= line('$')
            let ln_end = s:nextnonblank(ln_end+1)
        endwhile
    endif

    if a:inner || indent == 0
        let ln_start = s:nextnonblank(ln_start+1)
    endif

    if a:inner
        let ln_end = prevnonblank(ln_end-1)
    else
        let ln_end = ln_end - 1
    endif

    if ln_end < ln_start
        let ln_end = ln_start
    endif

    execute ln_end
    normal! V
    execute ln_start
endfunction

function! s:nextnonblank(lnum) abort
    let res = nextnonblank(a:lnum)
    if res == 0
        let res = line('$') + 1
    endif
    return res
endfunction

function! s:detect_nearest_line(lnum) abort
    let lnum = line('.')
    let nline = s:nextnonblank(lnum)
    let pline = prevnonblank(lnum)
    if abs(nline - lnum) > abs(pline - lnum) || getline(nline) =~ '^\s*$'
        return pline
    else
        return nline
    endif
endfunction

onoremap <silent>ii :<C-u>call <sid>indent_textobj(v:true)<Cr>
xnoremap <silent>ii :<C-u>call <sid>indent_textobj(v:true)<Cr>
onoremap <silent>ai :<C-u>call <sid>indent_textobj(v:false)<Cr>
xnoremap <silent>ai :<C-u>call <sid>indent_textobj(v:false)<Cr>

" Line text object
xnoremap il g_o^
onoremap il :<C-u>normal vil<Cr>
xnoremap al $o0
onoremap al :<C-u>normal val<Cr>

" Last change text object
xnoremap ic `]o`[
onoremap ic :<C-u>normal vic<Cr>
onoremap ac :<C-u>nornal vicV<Cr>

" Number text object
function! s:number_textobj()
    let rx_num = '\d\+\(\.\d\+\)*'
    if search(rx_num, 'ceW')
        normal v
        call search(rx_num, 'bcW')
    endif
endfunction

xnoremap <silent> in :<C-u>call <sid>number_textobj()<Cr>
onoremap in :<C-u>normal vin<Cr>
