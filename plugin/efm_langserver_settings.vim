"=============================================================================
" File: vim-efm-langserver-settings
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_vim-efm-langserver-settings')
    finish
endif
let g:loaded_vim-efm-langserver-settings = 1

let s:save_cpo = &cpo
set cpo&vim



let &cpo = s:save_cpo
unlet s:save_cpo
