" File: swift.vim
" Author: Keith Smiley
" Description: Runtime files for Swift
" Last Modified: June 13, 2014

if exists("b:current_syntax")
  finish
endif

" Comments
" Shebang
syntax match swiftShebang /#!.*$/

" Comment contained keywords
syntax keyword swiftTodos contained TODO XXX FIXME NOTE
syntax keyword swiftMarker contained MARK

" Comment patterns
syntax match swiftComment /\/\/.*$/
      \ contains=swiftTodos,swiftMarker
syntax region swiftComment start=/\/\*/ end=/\*\//
      \ contains=swiftTodos,swiftMarker


" Literals
" Strings
syntax region swiftString start=/"/ skip=/\\"/ end=/"/ oneline contains=swiftInterpolatedWrapper
syntax region swiftInterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=swiftString contains=swiftInterpolatedString
syntax match swiftInterpolatedString "\v\w+" contained containedin=swiftInterpolatedWrapper

" Numbers
syntax match swiftNumber /\<\d\+\>/
syntax match swiftNumber /\<\d\+\.\d\+\>/
syntax match swiftNumber /\<0x\x\+\>/
syntax match swiftNumber /\<0b[01]\+\>/
syntax match swiftNumber /\<0o\o\+\>/

" BOOLs
syntax keyword swiftBoolean
      \ true
      \ false


" Operators
syntax match swiftOperator "\v\~"
syntax match swiftOperator "\v\s+!"
syntax match swiftOperator "\v\%"
syntax match swiftOperator "\v\^"
syntax match swiftOperator "\v\&"
syntax match swiftOperator "\v[^/]\*[^/]"
syntax match swiftOperator "\v-"
syntax match swiftOperator "\v\+"
syntax match swiftOperator "\v\="
syntax match swiftOperator "\v\|"
syntax match swiftOperator "\v[^/]\/[^/]"
syntax match swiftOperator "\v\."
syntax match swiftOperator "\v\<"
syntax match swiftOperator "\v\>"


" Keywords {{{
syntax keyword swiftKeywords
      \ as
      \ break
      \ case
      \ class
      \ continue
      \ default
      \ deinit
      \ didSet
      \ do
      \ else
      \ extension
      \ fallthrough
      \ for
      \ func
      \ get
      \ if
      \ import
      \ in
      \ infix
      \ init
      \ inout
      \ is
      \ let
      \ mutating
      \ nil
      \ operator
      \ override
      \ postfix
      \ prefix
      \ protocol
      \ return
      \ self
      \ set
      \ static
      \ subscript
      \ super
      \ switch
      \ typealias
      \ unowned
      \ unowned(safe)
      \ unowned(unsafe)
      \ var
      \ weak
      \ where
      \ while
      \ willSet
" }}}

syntax keyword swiftStructure
      \ struct
      \ enum

syntax region swiftTypeWrapper start="\v:\s*" end="\v(,\s?\w+\s?\{)|[^\w]" contains=swiftString,swiftType,swiftGenericsWrapper transparent oneline
syntax region swiftGenericsWrapper start="\v\<" end="\v\>" contains=swiftType transparent oneline
syntax region swiftLiteralWrapper start="\v\=\s*" end="\v(\[\]|\(\))" contains=swiftType transparent oneline
syntax region swiftReturnWrapper start="\v-\>\s*" end="\v(\{|$)" contains=swiftType transparent oneline
syntax match swiftType "\v\w+" contained containedin=swiftGenericsWrapper,swiftTypeWrapper,swiftLiteralWrapper,swiftGenericsWrapper

syntax keyword swiftImports import


" Set highlights
highlight default link swiftTodos Todo
highlight default link swiftShebang Comment
highlight default link swiftComment Comment
highlight default link swiftMarker Comment

highlight default link swiftString String
highlight default link swiftInterpolatedWrapper Delimiter
highlight default link swiftNumber Number
highlight default link swiftBoolean Boolean

highlight default link swiftOperator Operator
highlight default link swiftKeywords Keyword
highlight default link swiftStructure Structure
highlight default link swiftType Type
highlight default link swiftImports Include


let b:current_syntax = "swift"
