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
let s:whitelist = s:List.filter(s:whitelist, 'v:val !=? "*"')

let s:args = []
if get(g:, 'efm_langserver_settings#config', 1)
  let s:args = extend(s:args, ['-c' , s:config_file ])
endif
if get(g:, 'efm_langserver_settings#debug', 0)
  let s:args = extend(s:args, ['-log' , s:debug_file ])
endif
function s:coc_efm_langserver_setup() abort
  let userconfig = get(g:, 'coc_user_config', {})
  let userconfig['languageserver'] = get(userconfig,'languageserver', {})

  let userconfig['languageserver']['efm'] = {
  \  'command': 'efm-langserver',
  \  'args': s:args,
  \  'filetypes': s:whitelist
  \}

  call coc#config('languageserver',userconfig.languageserver)
endfunction

augroup coc-efm-langserver-settings-init
  autocmd!
  autocmd VimEnter *
  \ if get(g:, 'did_coc_loaded', 0)
  \ | call s:coc_efm_langserver_setup()
  \ | endif
  autocmd VimEnter * autocmd! coc-efm-langserver-settings-init
augroup END

unlet s:config_dir s:settings
unlet s:V s:List

" EOF
