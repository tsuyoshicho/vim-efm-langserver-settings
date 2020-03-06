"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_lsp_efm_langserver_settings')
\ || !executable('efm-langserver')
\ || !exists('g:lsp_loaded')
  finish
endif
let g:loaded_lsp_efm_langserver_settings = 1

let s:args = ['efm-langserver']
if efm_langserver_settings#config_enable()
  let s:args = extend(s:args, ['-c', efm_langserver_settings#config_path()])
endif
if efm_langserver_settings#debug_enable()
  let s:args = extend(s:args, ['-log', efm_langserver_settings#debug_path()])
endif

let s:item = {
\  'name': 'efm-langserver',
\  'cmd': { server_info->s:args },
\  'whitelist': efm_langserver_settings#whitelist(),
\}

function! s:lsp_efm_langserver_setup() abort
  call lsp#register_server(s:item)
endfunction

augroup vim-lsp-efm-langserver-settings
  autocmd!
  autocmd User lsp_setup call s:lsp_efm_langserver_setup()
  \ | autocmd! vim-lsp-efm-langserver-settings
augroup END

unlet s:args

" EOF
