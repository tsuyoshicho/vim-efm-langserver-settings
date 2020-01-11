"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_lsp_efm_langserver_settings') && !executable('efm-langserver')
    finish
endif
let g:loaded_lsp_efm_langserver_settings = 1

let s:config_dir  = expand('<sfile>:h:h:h') . '/config/efm-langserver'
let s:config_file = expand(s:config_dir . '/config.yaml')
let s:settings    = json_decode(join(readfile(s:config_dir . '/settings.json'), "\n"))

let s:whitelist = []
" exe check temp impl
for data in s:settings
  if executable(data.cmd)
    call extend(s:whitelist, data.whitelist)
  endif
endfor

let g:efm_langserver_settings#item = {
          \ 'name': 'efm-langserver',
          \ 'cmd': {
          \   server_info->['efm-langserver',
          \                 '-c=' . s:config_file]
          \ },
          \ 'whitelist': uniq(sort(copy(s:whitelist))),
          \ }

if get(g:, 'efm_langserver_settings#debug', 0)
  let g:efm_langserver_settings#item.cmd = {
            \   server_info->['efm-langserver',
            \                 '-c=' . s:config_file,
            \                 '-log=' . expand('~/efm-langserver.log')]
            \}
endif

function! s:lsp_efm_langserver_setup() abort
  call lsp#register_server(g:efm_langserver_settings#item)
endfunction

augroup vim-lsp-efm-langserver-settings
  autocmd!
  autocmd User lsp_setup call s:lsp_efm_langserver_setup() | autocmd! vim-lsp-efm-langserver-settings
augroup END

" EOF

