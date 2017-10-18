function! ToggleCppHeader(filename)
    let extension = fnamemodify(a:filename, ':e')
    let ext4check = []
    if extension == "cpp"
        let ext4check += ["hpp", "h"]
    elseif (extension == "hpp" || extension == "h")
        let ext4check += ["cpp"]
    endif
    for ext in ext4check
        let checked_path = fnamemodify(a:filename, ':s?\..*$?.' . ext . '?')
        if filereadable(checked_path)
            exec ':e ' .  checked_path
            return
        endif
    endfor
    echo "can't toggle extension for " . a:filename
endfunction

nnoremap <C-H> :call ToggleCppHeader(expand("%"))<CR>
