"AUTHOR:   Greg Sexton <gregsexton@gmail.com>
"LICENSE:  Same terms as Vim itself (see :help license).

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

nnoremap <buffer> <silent> q :wq<cr>
"this should be able to take a count:
nnoremap <buffer> <silent> <cr> :call PomodoroAddTickBox()<cr>
nnoremap <buffer> <silent> <space> :call PomodoroMarkTodoElapsed("X")<cr>
nnoremap <buffer> <silent> - :call PomodoroMarkTodoElapsed("-")<cr>

inoremap <buffer> [ [ ]

fu! s:NumPatternsInString(str, pat)
"returns the number of patterns found in a string
    let i = 0
    let num = -1
    while i != -1
	let num = num + 1
	let i = matchend(a:str, a:pat, i)
    endwhile
    return num
endf

fu! CountPomodorosInLine(line)
    return s:NumPatternsInString(a:line, '(.)\|[.\]')
endfu

fu! CountCompletedPomodorosInLine(line)
    return s:NumPatternsInString(a:line, '(X)\|[X\]')
endfu

fu! CountPomodorosInBuffer()
    let cnt = 0
    for line in getline(1,'$')
        let cnt += CountPomodorosInLine(line)
    endfor
    return cnt
endfu

fu! CountCompletedPomodorosInBuffer()
    let cnt = 0
    for line in getline(1,'$')
        let cnt += CountCompletedPomodorosInLine(line)
    endfor
    return cnt
endfu

setlocal statusline=[%{CountCompletedPomodorosInBuffer()}/%{CountPomodorosInBuffer()}]

let &cpo = s:cpo_save
unlet s:cpo_save

 " vim:fdm=marker
