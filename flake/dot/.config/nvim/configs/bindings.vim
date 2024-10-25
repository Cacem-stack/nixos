" leader key
let mapleader = " "

let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'


" NERDTree Keybinding
nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <C-v> :vsplit<CR>
" nnoremap <C-s> :split<CR>
nnoremap <C-S-C> "+y
nnoremap <leader>p :CtrlPMRU<CR>

"term normal mode
"tnoremap <C-Space> <C-\><C-n>
tnoremap <esc> <C-\><C-n>

"collapse toggle
nnoremap <leader><Space> za

nnoremap <leader>s :call ToggleTerminal()<CR>
"nnoremap <esc> :call ToggleTerminal()<CR>

nnoremap <C-k> 5<C-w>+
nnoremap <C-j> 5<C-w>-
nnoremap <C-h> 5<C-w><
nnoremap <C-l> 5<C-w>>
nnoremap <leader>w <C-w>w
nnoremap <leader>- <C-w>_
nnoremap <leader>\ <C-w>\|
nnoremap <leader>= <C-w>=
nnoremap <leader>h <C-w>H
nnoremap <leader>v <C-w>V
nnoremap <leader>o <C-w>o

"coc.nvim keys
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
if has('nvim-0.4.3') || has('patch-8.2.0750')
          nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
          inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
          inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif
