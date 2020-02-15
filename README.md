# vim-efm-langserver-settings

## detail

trial vim lsp client - efm-langserver link and configure settings

### support lsp client

- [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
- [ale](https://github.com/dense-analysis/ale)

## installation

ex. with `vim-lsp` plugin

```vim
[[plugins]]
repo = 'tsuyoshicho/vim-efm-langserver-settings'
depends = ['vim-lsp']
```

### install command/plugin

- [efm-langserver](https://github.com/mattn/efm-langserver)
- lsp plugin
- linter commands if you need

## support linter

| linter                | type                | config status                            | lint/format  | note                                                                                                                                                                                                                                                                                               |
|-----------------------|---------------------|------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| vint                  | vim                 | not need config                          | lint         |                                                                                                                                                                                                                                                                                                    |
| markdownlint          | markdown            | not need config / user config affected   | lint, format | `.markdownlint.json` in the current directory<br> [setting in project root sample](example/efm-langserver/root/.markdownlint.json)                                                                                                                                                                 |
| vale                  | text, markdown, rst | not included config / user config needed | lint         | `.vale.ini` in the current directory<br> `$HOME` directory <br> [setting in home sample](example/efm-langserver/home/.vale.ini)                                                                                                                                                                    |
| cppcheck              | c, cpp              | not need config                          | lint         |                                                                                                                                                                                                                                                                                                    |
| shellcheck            | sh                  | not need config / user config affected   | lint         | `.shellcheckrc` or `shellcheckrc` in the current directory(search parent upto root)<br> `~/.shellcheckrc` <br>  XDG config directory (usually `~/.config/shellcheckrc` ) on Unix, or `%APPDATA%/shellcheckrc` on Windows. <br> [setting in home sample](example/efm-langserver/home/.shellcheckrc) |
| jq                    | json                | not need config                          | format       |                                                                                                                                                                                                                                                                                                    |
| fixjson               | json, json5         | not need config                          | format       |                                                                                                                                                                                                                                                                                                    |
| yamllint              | yaml                | not need config / user config affected   | lint         | `.yamllint` , `.yamllint.yaml` or `.yamllint.yml` in the current working directory<br> `$XDG_CONFIG_HOME/yamllint/config` <br> `~/.config/yamllint/config`                                                                                                                                         |
| restructuredtext-lint | rst                 | not need config                          | lint         |                                                                                                                                                                                                                                                                                                    |

If not linter exists, not set support type at efm-langserver.

**Please contribute any other linter setting(mapping, efm-langserver setting, user setting sample)**
If you contribute, fork and create PR.

## related

- [efm-langserver](https://github.com/mattn/efm-langserver)
