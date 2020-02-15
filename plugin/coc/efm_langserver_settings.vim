"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_coc_efm_langserver_settings')
          \ || !executable('efm-langserver')
  finish
endif
let g:loaded_coc_efm_langserver_settings = 1

let s:config_dir  = expand('<sfile>:h:h:h') . '/config/efm-langserver'
let s:config_file = expand(s:config_dir . '/config.yaml')
let s:settings    = json_decode(join(readfile(s:config_dir
          \                                   . '/settings.json'), "\n"))

let s:whitelist = []
for s:data in s:settings
  if executable(s:data.cmd)
    call extend(s:whitelist, s:data.whitelist)
  endif
endfor

let s:userconfig = get(g:, 'coc_user_config', {})
let s:userconfig['languageserver'] = get(s:userconfig,'languageserver', {})

call coc#config('languageserver',extend(s:userconfig.languageserver,{
\ 'efm': {
\   'command': 'efm-langserver',
\   'args': ['-c=' . s:config_file],
\   'filetypes': s:whitelist
\ }
\}, 'force'))

unlet s:config_dir s:config_file s:whitelist s:settings s:userconfig

" EOF
