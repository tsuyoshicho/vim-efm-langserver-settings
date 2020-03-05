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

let s:config_dir  = expand('<sfile>:h:h:h:h') . '/config/efm-langserver'
let s:config_file = get(g:, 'efm_langserver_settings#config_file', expand(s:config_dir . '/config.yaml'))
let s:debug_file  = get(g:, 'efm_langserver_settings#debug_file',  expand($HOME . '/efm-langserver.log'))
let s:settings    = json_decode(join(readfile(s:config_dir
\                                   . '/settings.json'), "\n"))


let s:V = vital#efmlangserversettings#new()
let s:List = s:V.import('Data.List')

let s:whitelist = []
for s:data in s:settings
  if executable(s:data.cmd)
    call extend(s:whitelist, s:data.whitelist)
  endif
endfor
let s:whitelist = uniq(sort(copy(s:whitelist)))
if s:List.has(s:whitelist,'*')
  let s:whitelist = ['*']
endif

let s:args = ['efm-langserver']
if get(g:, 'efm_langserver_settings#config', 1)
  let s:args = extend(s:args, ['-c' , s:config_file ])
endif
if get(g:, 'efm_langserver_settings#debug', 0)
  let s:args = extend(s:args, ['-log' , s:debug_file ])
endif

let s:item = {
\ 'name': 'efm-langserver',
\ 'cmd': {
\   server_info->s:args
\ },
\ 'whitelist': s:whitelist,
\ }

function! s:lsp_efm_langserver_setup() abort
  call lsp#register_server(s:item)
endfunction

augroup vim-lsp-efm-langserver-settings
  autocmd!
  autocmd User lsp_setup call s:lsp_efm_langserver_setup()
  \ | autocmd! vim-lsp-efm-langserver-settings
augroup END

unlet s:config_dir s:settings s:whitelist s:data
unlet s:V s:List

" EOF
