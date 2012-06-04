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

let &cpo = s:cpo_save
unlet s:cpo_save

 " vim:fdm=marker
