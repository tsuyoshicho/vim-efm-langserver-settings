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

let s:args = ['efm-langserver']
if efm_langserver_settings#config_enable()
  let s:args = extend(s:args, ['-c', efm_langserver_settings#config_path()])
endif
if efm_langserver_settings#debug_enable()
  let s:args = extend(s:args, ['-logfile', efm_langserver_settings#debug_path()])
  let s:args = extend(s:args, ['-loglevel', efm_langserver_settings#debug_enable()])
endif
let s:cmd = join(s:args, ' ')

for s:typename in efm_langserver_settings#whitelist_without_any()
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

unlet s:args s:cmd s:typename

" EOF
