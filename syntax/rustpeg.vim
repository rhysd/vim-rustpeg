if version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif

" Extends Rust syntax highlight.  There looks no conflict with PEG and Rust in
" terms of highlighting.
runtime! syntax/rust.vim

syn keyword rustpegSpecialName __
syn match rustpegParens "\%(\[\|]\|(\|)\|{\|}\)" display
syn match rustpegCapture "\<\h\w*:\ze\S\+" display
syn match rustpegRuleDefine "\_^\s*\h\w*\ze\s\+->" display
syn match rustpegRuleDefine "\_^\s*\h\w*\ze\_s*=" display
syn match rustpegRuleType "\%(\_^\s*\h\w*\s\+->\s\+\)\@<=\h\w*\>" display

hi def link rustpegSpecialName Special
hi def link rustpegCapture Identifier
hi def link rustpegRuleDefine Define
hi def link rustpegRuleType Type
hi def link rustpegParens Operator

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = 'rustpeg'
