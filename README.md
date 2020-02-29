# vim-efm-langserver-settings

## detail

trial vim lsp client - efm-langserver link and configure settings

### support lsp client

- [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
- [ale](https://github.com/dense-analysis/ale)
- [coc.nvim](https://github.com/neoclide/coc.nvim)

## installation

ex. with `vim-lsp` plugin

```vim
[[plugins]]
repo = 'tsuyoshicho/vim-efm-langserver-settings'
depends = ['vim-lsp']
```

NOTE:
If you install `vim-lsp-settings` plugin,  LspInstallServer command using are ok, but settings please keeping to disabled.
This plugin setup efm-langserver.

### install command/plugin

- [efm-langserver](https://github.com/mattn/efm-langserver)
- lsp plugin
- linter commands if you need

## support linter

| command               | type                      | config status                            | lint/format  | note                                                                                                                                                                                                                                                                                               |
|-----------------------|---------------------------|------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| vint                  | vim                       | not need config                          | lint         |                                                                                                                                                                                                                                                                                                    |
| markdownlint          | markdown                  | not need config / user config affected   | lint, format | `.markdownlint.json` in the current directory<br> [setting in project root sample](example/efm-langserver/root/.markdownlint.json)                                                                                                                                                                 |
| vale                  | text, markdown, rst, help | not included config / user config needed | lint         | `.vale.ini` in the current directory<br> `$HOME` directory <br> [setting in home sample](example/efm-langserver/home/.vale.ini)                                                                                                                                                                    |
| nvcheck               | text, markdown, rst, help | not included config / user config needed | lint         | `dict.yml` in the project root<br> [sample in vimdoc-jp-working](https://github.com/vim-jp/vimdoc-ja-working/blob/master/dict.yml)                                                                                                                                                                 |
| eslint                | javascript, typescript    | not included config / user config needed | lint, format | `.eslintrc.js`, `.eslintrc.yaml (yml)`, `.eslintrc.json`, `package.json`                                                                                                                                                                                                                           |
| mypy                  | python                    | not need config / user config affected   | lint         | `mypy.ini`, `setup.cfg`  in project root. `.mypy.ini` in home                                                                                                                                                                                                                                      |
| cppcheck              | c, cpp                    | not need config                          | lint         |                                                                                                                                                                                                                                                                                                    |
| shellcheck            | sh                        | not need config / user config affected   | lint         | `.shellcheckrc` or `shellcheckrc` in the current directory(search parent upto root)<br> `~/.shellcheckrc` <br>  XDG config directory (usually `~/.config/shellcheckrc` ) on Unix, or `%APPDATA%/shellcheckrc` on Windows. <br> [setting in home sample](example/efm-langserver/home/.shellcheckrc) |
| shfmt                 | sh                        | not need config                          | format       |                                                                                                                                                                                                                                                                                                    |
| jq                    | json                      | not need config                          | format       |                                                                                                                                                                                                                                                                                                    |
| fixjson               | json, json5               | not need config                          | format       |                                                                                                                                                                                                                                                                                                    |
| yamllint              | yaml                      | not need config / user config affected   | lint         | `.yamllint` , `.yamllint.yaml` or `.yamllint.yml` in the current working directory<br> `$XDG_CONFIG_HOME/yamllint/config` <br> `~/.config/yamllint/config`                                                                                                                                         |
| restructuredtext-lint | rst                       | not need config                          | lint         |                                                                                                                                                                                                                                                                                                    |

If not command exists, command's supporting type no setup.

**Please contribute any other linter setting(mapping, efm-langserver setting, user setting sample)**
If you contribute, fork and create PR.

## related

- [efm-langserver](https://github.com/mattn/efm-langserver)
