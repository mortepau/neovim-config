function! RetrieveDiagnostics() abort
    " Sort based on bufnr, type, lnum, then col
    function! SortDict_(i1, i2, order, severityOrder) abort
        if len(a:order) == 0
            return 0
        endif
        if a:order[0] ==? 'type'
            let i1 = a:severityOrder[a:i1[a:order[0]]]
            let i2 = a:severityOrder[a:i2[a:order[0]]]
        else
            let i1 = a:i1[a:order[0]]
            let i2 = a:i2[a:order[0]]
        endif
        if i1 < i2
            return -1
        elseif i2 < i1
            return 1
        else
            return SortDict_(a:i1, a:i2, a:order[1:], a:severityOrder)
        endif
    endfunction
    function! SortDict(i1, i2) abort
        let order = ['bufnr', 'type', 'lnum', 'col']
        let severityOrder = {'E': 0, 'W': 1, 'I': 2, 'H': 3}
        return SortDict_(a:i1, a:i2, order, severityOrder)
    endfunction

    let diagnosticKinds = ["E", "W", "I", "H"]
    let bufnrs = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
    let rawDiagnostics = {}
    for bufnr in bufnrs
        let table = luaeval('vim.lsp.diagnostic.diagnostics_by_buf[_A]', bufnr)
        if type(table) == type(v:null) || len(table) == 0
            continue
        endif
        let rawDiagnostics[bufnr] = table
    endfor

    let parsedDiagnostics = []
    for [bufnr, diagnostics] in items(rawDiagnostics)
        if type(diagnostics) != type([])
            continue
        endif
        for diagnostic in diagnostics
            let map = {
                        \ "bufnr": bufnr,
                        \ "filename": bufname(bufnr + 0),
                        \ "lnum": diagnostic["range"]["end"]["line"] + 1,
                        \ "col": diagnostic["range"]["end"]["character"] + 1,
                        \ "text": diagnostic["message"],
                        \ "type": diagnosticKinds[diagnostic.severity - 1],
                    \ }
            call add(parsedDiagnostics, map)
        endfor
    endfor
    return sort(parsedDiagnostics, "SortDict")
endfunction
