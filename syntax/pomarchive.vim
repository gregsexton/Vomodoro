" Vim syntax file
" Language:	Pomodoro archive
" Maintainer:	Greg Sexton <gregsexton@gmail.com>

if exists("b:current_syntax")
    finish
endif

runtime! syntax/pomtodo.vim

syn match pomHeader /^*.*$/

hi def link pomHeader Title

let b:current_syntax = "pomarchive"
