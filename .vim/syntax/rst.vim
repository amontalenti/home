" reST syntax file
" Language:	reStructured Text
" Filenames:	*.rst,*.rest
function! s:SynFgColor(hlgrp)
    return synIDattr(synIDtrans(hlID(a:hlgrp)), 'fg')
endfun

function! s:SynBgColor(hlgrp)
    return synIDattr(synIDtrans(hlID(a:hlgrp)), 'bg')
endfun

syn match rstEnumeratedList /^\s*[0-9#]\{1,3}\.\s/
syn match rstBulletedList /^\s*[+*-]\s/
syn match rstNbsp /[\xA0]/
syn match rstEmDash /[\u2014]/
syn match rstUnicode /[\u2013\u2018\u2019\u201C\u201D]/ " – ‘ ’ “ ”
syn match rstHeader /^[-=~]*$/

exec 'hi def rstBold    term=bold cterm=bold gui=bold guifg=' . s:SynFgColor('PreProc')
exec 'hi def rstHeader term=bold cterm=bold gui=bold guifg=' . s:SynFgColor('PreProc')
exec 'hi def rstItalic  term=italic cterm=italic gui=italic guifg=' . s:SynFgColor('Statement')
exec 'hi def rstNbsp    gui=underline guibg=' . s:SynBgColor('ErrorMsg')
exec 'hi def rstEmDash  gui=bold guifg=' . s:SynFgColor('Title') . ' guibg='. s:SynBgColor('Folded')
exec 'hi def rstUnicode guifg=' . s:SynFgColor('Number')

hi link rstEmphasis       rstItalic
hi link rstStrongEmphasis rstBold
hi link rstEnumeratedList Operator
hi link rstBulletedList   Operator

source $VIMRUNTIME/syntax/rst.vim

syn cluster rstCruft                contains=rstEmphasis,rstStrongEmphasis,
      \ rstInterpretedText,rstInlineLiteral,rstSubstitutionReference,
      \ rstInlineInternalTargets,rstFootnoteReference,rstHyperlinkReference,
      \ rstNbsp,rstEmDash,rstUnicode

