" NERDTree options
let NERDTreeShowHidden=1
let g:NERDTreeAutoClose = 1
"let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
