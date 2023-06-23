function! ToggleCppHeader(filename)
    let extension = fnamemodify(a:filename, ':e')
    let ext4check = []
    if extension == "cpp"
        let ext4check += ["hpp", "h"]
    elseif extension == "c"
        let ext4check += ["h"]
    elseif (extension == "hpp")
        let ext4check += ["cpp"]
    elseif (extension == "h")
        let ext4check += ["cpp", "c", "m", "mm"]
    elseif (extension == "m" || extension == "mm")
        let ext4check += ["h"]
    endif
    for ext in ext4check
        let checked_path = fnamemodify(a:filename, ':s?\.[^\.]*$?.' . ext . '?')
        if filereadable(checked_path)
            exec ':e ' .  checked_path
            return
        endif
    endfor
    echo "can't toggle extension for " . a:filename
endfunction

nnoremap <C-H> :call ToggleCppHeader(expand("%"))<CR>
