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
  \ 'capture',
  \ 'defx',
  \ 'denite',
  \ 'denite-filter',
  \ 'diff',
  \ 'dirvish',
  \ 'fern',
  \ 'fugitiveblame',
  \ 'fzf',
  \ 'gina-blame',
  \ 'gina-branch',
  \ 'gina-changes',
  \ 'gina-commit',
  \ 'gina-grep',
  \ 'gina-log',
  \ 'gina-ls',
  \ 'gina-reflog',
  \ 'gina-stash-list',
  \ 'gina-stash-show',
  \ 'gina-status',
  \ 'gina-tag',
  \ 'gitcommit',
  \ 'gitrebase',
  \ 'gitsendemail',
  \ 'man',
  \ 'qfreplace',
  \ 'startify',
  \ 'tagbar',
  \ 'terminal',
  \ 'unite',
  \ 'vimfiler',
  \ 'vista',
  \ 'vista_kind',
  \ 'vista_markdown',
  \ ]

let &cpo = s:save_cpo
unlet s:save_cpo
