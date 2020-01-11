"=============================================================================
" File: efm_langserver_settings.vim
" Author: Tsuyoshi CHO
" Created: 2020-01-11
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_ale_efm_langserver_settings') && !executable('efm-langserver')
  finish
endif
let g:loaded_ale_efm_langserver_settings = 1

let s:config_dir  = expand('<sfile>:h:h:h') . '/config/efm-langserver'
let s:config_file = expand(s:config_dir . '/config.yaml')
let s:settings    = json_decode(join(readfile(s:config_dir . '/settings.json'), "\n"))

let s:whitelist = []
for data in s:settings
  if executable(data.cmd)
    call extend(s:whitelist, data.whitelist)
  endif
endfor

let g:ale_linters  = get(g:, 'ale_linters', {})

if !emtpy(s:whitelist)
  for typename in s:whitelist
    call ale#linter#Define(typename, {
              \   'name': 'efm-langserver',
              \   'lsp': 'stdio',
              \   'executable': 'efm-langserver',
              \   'command': '%e',
              \   'project_root': {buffer->ale#path#FindNearestDirectory(buffer, '')},
              \})

    let lintlist = []
    if has_key(g:ale_linters, typename)
      let lintlist = g:ale_linters[typename]
    endif
    let g:ale_linters[typename] = uniq(sort(lintlist + ['efm-langserver']))

  endfor
endif

" EOF

