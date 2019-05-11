" Vim syntax file
" Language:     BPL
" Maintainer:   Wang Xuerui <git@xen0n.name>
" Last Change:  May 11, 2019
" For bugs, patches and license go to https://github.com/xen0n/bpl.vim

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Syntax definitions {{{1
" Basic keywords {{{2
syn keyword bplConditional case if elif else
" this is taken from go.vim
syn keyword bplLabel default

syn keyword bplAssert  assert
syn keyword bplPanic   fatal
syn keyword bplKeyword dump
syn keyword bplKeyword skip
syn keyword bplKeyword let
syn keyword bplKeyword eval
" TODO: do <qlang expr>
syn keyword bplKeyword do

" Built-in types {{{2
syn keyword bplType int8 uint8 char byte
syn keyword bplType int16 uint16 uint16be uint16le
syn keyword bplType int32 uint32 uint32be uint32le
syn keyword bplType int64 uint64 uint64be uint64le
syn keyword bplType uint24 uint24be uint24le
syn keyword bplType float32 float32be float32le
syn keyword bplType float64 float64be float64le
syn keyword bplType cstring
syn keyword bplType bson
syn keyword bplType nil

syn match  bplEscapeError   display contained /\\./
syn match  bplEscape        display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match  bplEscapeUnicode display contained /\\\(u\%(\x*\)\{4}\|U\%(\x*\)\{8}\)/
syn match  bplStringContinuation display contained /\\\n\s*/
syn region bplString      start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=bplEscape,bplEscapeUnicode,bplEscapeError,bplStringContinuation,@Spell

syn region bplCommentLine start="//" end="$" contains=bplTodo,@Spell

syn keyword bplTodo contained TODO FIXME XXX NB NOTE

" Folding rules {{{2
" Trivial folding rules to begin with.
" FIXME: use the AST to make really good folding
syn region bplFoldBraces start="{" end="}" transparent fold

" Default highlighting {{{1
hi def link bplEscape Special
hi def link bplEscapeUnicode bplEscape
hi def link bplEscapeError Error
hi def link bplStringContinuation Special
hi def link bplString String
hi def link bplKeyword Keyword
hi def link bplConditional Conditional
hi def link bplLabel Label
hi def link bplCommentLine Comment
hi def link bplAssert PreCondit
hi def link bplPanic PreCondit

hi def link bplType Type
hi def link bplTodo Todo

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "bpl"

" vim: set et sw=4 sts=4 ts=8:
