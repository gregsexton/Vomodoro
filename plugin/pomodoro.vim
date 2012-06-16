"AUTHOR:   Greg Sexton <gregsexton@gmail.com>
"LICENSE:  Same terms as Vim itself (see :help license).

if exists("g:loaded_pomodoro") || v:version < 700
  finish
endif
let g:loaded_pomodoro = 1

let s:savecpo = &cpo
set cpo&vim

" Globals {{{1

if !exists("g:Pomo_ToDoTodayFilePath")
    let g:Pomo_ToDoTodayFilePath = expand("$HOME") . '/todotoday'
endif

if !exists("g:Pomo_ArchiveFilePath")
    let g:Pomo_ArchiveFilePath = expand("$HOME") . '/archive'
endif

" Commands: {{{1

"TODO: break out commands for splits, vertical and tab as well as normal.
command! -nargs=0 -bar PomodoroToDoToday call s:OpenToDoToday()
command! -nargs=0 -bar PomodoroArchive call s:TransferAndOpenArchive()

" Functions: {{{1

fu! s:ResizeWindow()
    exec 'resize' line('$')
endfu

fu! s:OpenToDoToday()
    exec "botright sp" g:Pomo_ToDoTodayFilePath
    call s:ResizeWindow()
    set winfixheight
    set ft=pomtodo
    1
endfu

fu! s:OpenArchive()
    exec "e" g:Pomo_ArchiveFilePath
    set ft=pomarchive
    $
endfu

fu! s:ArchiveHeader()
    return "* " . strftime("%Y-%m-%d")
endfu

fu! s:TransferAndOpenArchive() abort
    call s:OpenArchive()
    let lines = readfile(g:Pomo_ToDoTodayFilePath)
    if empty(lines)
        echomsg "Todo Today file is empty."
    else
        let failed = append(line('$'), "")
        let failed += append(line('$'), s:ArchiveHeader())
        let failed += append(line('$'), lines)
        if failed > 0
            echoerr "Failed to append to the archive file."
        endif
    endif
endfu

fu! s:PomodoroAlignCheckBoxes()
    if exists(":Tabularize")
        Tabularize /\c[([][ X-][)\]]/l1l0
    endif
endfu

fu! PomodoroAddTickBox(cnt)
    if getline('.') =~ '\[X]'
        exec 'normal! '.a:cnt.'A( )'
    else
        exec 'normal! '.a:cnt.'A[ ]'
    endif

    call s:PomodoroAlignCheckBoxes()
endfu

fu! PomodoroMarkTodoElapsed(marker)
    "if a pomodoro has been allocated tick it off, otherwise add an unplanned pomodoro
    try
        exec 's/\([[(]\) \([)\]]\)/\1'.a:marker.'\2'.(a:marker == '-'?'/g':'')
    catch /E486/
        normal! A(X)
    endtry
    call s:PomodoroAlignCheckBoxes()
endfu
"}}}1

let &cpo = s:savecpo
unlet s:savecpo

 " vim:fdm=marker
