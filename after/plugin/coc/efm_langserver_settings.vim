"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_coc_efm_langserver_settings')
\ || !executable('efm-langserver')
\ || !exists('g:did_coc_loaded')
  finish
endif
let g:loaded_coc_efm_langserver_settings = 1

let s:args = []
if efm_langserver_settings#config_enable()
  let s:args = extend(s:args, ['-c', efm_langserver_settings#config_path()])
endif
if efm_langserver_settings#debug_enable()
  let s:args = extend(s:args, ['-logfile', efm_langserver_settings#debug_path()])
  let s:args = extend(s:args, ['-loglevel', efm_langserver_settings#debug_enable()])
endif

function s:coc_efm_langserver_setup() abort
  call coc#config('languageserver.efm', {
  \  'command': 'efm-langserver',
  \  'args': s:args,
  \  'filetypes': efm_langserver_settings#support_filetype_list(),
  \})
endfunction

augroup coc-efm-langserver-settings-init
  autocmd!
  autocmd VimEnter *
  \ if get(g:, 'did_coc_loaded', 0)
  \ | call s:coc_efm_langserver_setup()
  \ | endif
  autocmd VimEnter * autocmd! coc-efm-langserver-settings-init
augroup END

" EOF
