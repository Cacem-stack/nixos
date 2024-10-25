"ToggleTerminal
function! ToggleTerminal()
    let term_buf = bufnr('%')
    let found = 0
    for buf in range(1, bufnr('$'))
        if getbufvar(buf, '&buftype', '') ==# 'terminal'
            if bufnr('%') == buf
                hide
            else
                botright 8split | execute 'buffer' buf
            endif
            let found = 1
            break
        endif
    endfor

    if found == 0
        botright 8sp | term
    endif
endfunction
