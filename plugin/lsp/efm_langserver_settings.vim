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
let s:settings = json_decode(join(readfile(s:config_dir.'/settings.json'), "\n"))

let s:whitelist = []
" exe check temp impl
for data in s:settings
  if executable(data.cmd)
    call extend(s:whitelist, data.whitelist)
  endif
endfor

let g:efm_langserver_settings#items = get(g:, 'efm_langserver_settings#items', [])
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

