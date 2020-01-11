"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_efm_langserver_settings') && !executable('efm-langserver')
    finish
endif
let g:loaded_efm_langserver_settings = 1

let s:config_dir = expand('<sfile>:h:h:h').'/config'

let s:whitelist = []
" exe check temp impl
if executable('vint')
  call extend(s:whitelist, ['vim'])
endif
if executable('markdownlint')
  call extend(s:whitelist, ['markdown'])
endif
if executable('vale')
  call extend(s:whitelist, ['text', 'asciidoc', 'markdown'])
endif
if executable('cppcheck')
  call extend(s:whitelist, ['c', 'cpp'])
endif
if executable('shellcheck')
  call extend(s:whitelist, ['sh'])
endif
if executable('jq')
  call extend(s:whitelist, ['json'])
endif

let g:efm_langserver_settings#items = []
let efm_debug = 0
if !efm_debug
  call add(g:efm_langserver_settings#items, {
            \ 'name': 'efm-langserver',
            \ 'cmd': {
            \   server_info->['efm-langserver',
            \                 '-c=' . expand(s:config_dir . '/config.yaml')]
            \ },
            \ 'whitelist': uniq(sort(copy(s:whitelist))),
            \ })
else
  call add(g:efm_langserver_settings#items, {
            \ 'name': 'efm-langserver',
            \ 'cmd': {
            \   server_info->['efm-langserver',
            \                 '-c=' . expand(s:config_dir . '/config.yaml'),
            \                 '-log=' . expand('~/efm-langserver.log')]
            \ },
            \ 'whitelist': uniq(sort(copy(s:whitelist))),
            \ })
endif

function! s:lsp_efm_langserver_setup() abort
  for item in g:efm_langserver_settings#items
    call lsp#register_server(item)
  endfor
endfunction

augroup vim-lsp-efm-langserver-settings
  autocmd!
  autocmd User lsp_setup call s:lsp_efm_langserver_setup() | autocmd! vim-lsp-efm-langserver-settings
augroup END

" EOF

