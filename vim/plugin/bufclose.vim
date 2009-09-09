function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else 
        " this try-catch block is disgusting
        try  
            bprev
        catch /.*/ " catch if we can't switch to previous
        endtry
    endif

    if bufnr("%") == l:currentBufNum
        new  
    endif

    if bufloaded(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

command! Bclose call <SID>BufcloseCloseIt()

