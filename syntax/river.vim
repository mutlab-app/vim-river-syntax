" river.vim: Vim syntax file for River.

if exists('b:current_syntax')
  finish
end

syn keyword riverTodo     contained TODO FIXME XXX BUG NOTE
syn keyword riverConstant           true false null

syn region riverComment start=/\/\// end=/$/    contains=riverTodo
syn region riverComment start=/\/\*/ end=/\*\// contains=riverTodo

syn region riverString start=/"/ end=/"/ contains=riverEscape

syn match riverEscape display contained "\\[0-7]\{3}"
syn match riverEscape display contained +\\[abfnrtv\\'"]+
syn match riverEscape display contained "\\x\x\{2}"
syn match riverEscape display contained "\\u\x\{4}"
syn match riverEscape display contained "\\U\x\{8}"
syn match riverEscape display contained +\\[^0-7xuUabfnrtv\\'"]+

syn match riverInt   "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
syn match riverFloat "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match riverFloat "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"

syn match  riverBlockHeader /^[^=]\+{/ contains=riverBlockName,riverBlockLabel,riverComment
syn match  riverBlockName   /^\s*\([A-Za-z_][A-Za-z0-9_]*\)\(\.\([A-Za-z_][A-Za-z0-9_]*\)\)*/ skipwhite contained
syn region riverBlockLabel  start=/"/ end=/"/ contained

hi def link riverBlockName  Structure
hi def link riverBlockLabel String
hi def link riverString     String
hi def link riverEscape     Special
hi def link riverInt        Number
hi def link riverFloat      Number
hi def link riverConstant   Constant
hi def link riverComment    Comment
hi def link riverTodo       Todo

let b:current_syntax = 'river'
