"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_ale_efm_langserver_settings')
\ || !executable('efm-langserver')
\ || !exists('g:loaded_ale')
  finish
endif
let g:loaded_ale_efm_langserver_settings = 1

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

function! s:_SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
endfunction

function! s:linter_setup() abort
  let lintlist = []
  if exists('b:ale_linters')
    if type(b:ale_linters) is type('')
      let lintlist = [b:ale_linters]
    elseif type(b:ale_linters) is type([])
      let lintlist = b:ale_linters
    else
      " ignore / force overwrite
    endif
  endif
  let b:ale_linters = uniq(sort(lintlist + ['efm-langserver']))
endfunction

augroup ale-efm-langserver-settings-init
  autocmd!
augroup END
augroup ale-efm-langserver-settings
  autocmd!
augroup END

let s:cmd = 'efm-langserver'
if get(g:, 'efm_langserver_settings#config', 1)
  let s:cmd = s:cmd . ' -c ' . s:config_file
endif
if get(g:, 'efm_langserver_settings#debug', 0)
  let s:cmd = s:cmd . ' -log ' . s:debug_file
endif
for s:typename in s:whitelist
  execute 'autocmd ale-efm-langserver-settings-init VimEnter *'
  \ . 'if get(g:, "loaded_ale", 0)'
  \ . '|  call ale#linter#Define("' . s:typename . '", {'
  \ . '   "name": "efm-langserver",'
  \ . '   "lsp": "stdio",'
  \ . '   "executable": "efm-langserver",'
  \ . '   "command":"' .  s:cmd . '",'
  \ . '   "project_root":'
  \ . '     {buffer->ale#path#FindNearestDirectory(buffer, "")},'
  \ . '  })'
  \ . '| endif'

  execute 'autocmd ale-efm-langserver-settings Filetype ' . s:typename
  \ . ' if get(g:, "loaded_ale", 0)'
  \ . ' | call ' . printf('<SNR>%s_', s:_SID()) . 'linter_setup()'
  \ . ' | endif'
endfor
autocmd ale-efm-langserver-settings-init VimEnter * autocmd! ale-efm-langserver-settings-init

unlet s:config_dir s:config_file s:debug_file s:settings s:whitelist  s:data s:cmd s:typename
unlet s:V s:List

" EOF
