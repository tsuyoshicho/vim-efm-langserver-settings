"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

let s:V = vital#efmlangserversettings#new()
let s:List = s:V.import('Data.List')

let s:config_dir = expand('<sfile>:h:h') . '/config/efm-langserver'
let s:settings   = json_decode(join(readfile(s:config_dir . '/settings.json'), "\n"))

function! s:get_whitelist() abort
  let wl = []
  if get(g:, 'efm_langserver_settings#config', 1)
    " use inner
    if !exists('s:whitelist')
      let whitelist = []
      for data in s:settings
        if executable(data.cmd)
          call extend(whitelist, data.whitelist)
        endif
      endfor
      let s:whitelist = uniq(sort(whitelist))
    endif
    " remove skiplist
    let skiplist = get(g:, 'efm_langserver_settings#skip_filetype_list', [])

    let wl = s:List.filter(s:whitelist, {v -> !s:List.has(skiplist, v)})
  else
    " use custom
    let wl = get(g:, 'efm_langserver_settings#custom_filetype_list', [])
  endif
  return wl
endfunction

function! efm_langserver_settings#whitelist() abort
  let wl = s:get_whitelist()
  if s:List.has(wl,'*')
    let wl = ['*']
  endif
  return wl
endfunction

function! efm_langserver_settings#whitelist_without_any() abort
  return s:List.filter(s:get_whitelist(), 'v:val !=? "*"')
endfunction

function! efm_langserver_settings#config_path() abort
  return get(g:, 'efm_langserver_settings#config_file', expand(s:config_dir . '/config.yaml'))
endfunction

function! efm_langserver_settings#debug_path() abort
  return get(g:, 'efm_langserver_settings#debug_file',  expand($HOME . '/efm-langserver.log'))
endfunction

function! efm_langserver_settings#config_enable() abort
  return get(g:, 'efm_langserver_settings#config', 1)
endfunction

function! efm_langserver_settings#debug_enable() abort
  return get(g:, 'efm_langserver_settings#debug', 0)
endfunction

" EOF
