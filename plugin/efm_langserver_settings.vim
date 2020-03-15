"=============================================================================
" File: vim-efm-langserver-settings
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_vim_efm_langserver_settings')
    finish
endif
let g:loaded_vim_efm_langserver_settings = 1

let s:save_cpo = &cpo
set cpo&vim

let g:efm_langserver_settings#filetype_blacklist = [
  \ 'denite',
  \ 'denite-filter',
  \ 'dirvish',
  \ 'fugitiveblame',
  \ 'fzf',
  \ 'gitcommit',
  \ 'gitrebase',
  \ 'gitsendemail',
  \ 'startify',
  \ 'tagbar',
  \ 'terminal',
  \ 'unite',
  \ 'vimfiler',
  \ ]

let &cpo = s:save_cpo
unlet s:save_cpo
