" LaTex settings

" Enable spelling and set language to english
setlocal spell
setlocal spelllang=en


" Wrap text and indent broken text
setlocal wrap
setlocal breakindent

" Add indentation equal to the shiftwidth on broken lines
let &l:showbreak=repeat(' ', shiftwidth())

" Make j and k behave as gj and gk unless with a count
nnoremap <buffer> <expr> j v:count > 0 ? 'j' : 'gj'
nnoremap <buffer> <expr> k v:count > 0 ? 'k' : 'gk'
