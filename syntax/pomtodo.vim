" Vim syntax file
" Language:	Pomodoro to do today.
" Maintainer:	Greg Sexton <gregsexton@gmail.com>

if exists("b:current_syntax")
    finish
endif

syn match pomComplete /.*/
syn match pomTask /.*\(\[ ]\|( )\)/
syn match pomEstimate /\[ ]/ contained containedin=pomTask,pomComplete
syn match pomElapsed /\[X]/ contained containedin=pomTask,pomComplete
syn match pomNotNeeded /\[-]/ contained containedin=pomTask,pomComplete
syn match pomExtra /(X)/ contained containedin=pomTask,pomComplete

hi def link pomTask Statement
hi def link pomComplete Comment

hi def link pomEstimate Type
hi def link pomElapsed Comment
hi def link pomNotNeeded Function
hi def link pomExtra ErrorMsg

let b:current_syntax = "pomtodo"
