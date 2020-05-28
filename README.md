# vim-efm-langserver-settings

## detail

vim lsp client - efm-langserver link and configure settings.

### support lsp client

- [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
- [ale](https://github.com/dense-analysis/ale)
- [coc.nvim](https://github.com/neoclide/coc.nvim)

## installation

ex. with `vim-lsp` plugin

```toml
[[plugins]]
repo = 'tsuyoshicho/vim-efm-langserver-settings'
depends = ['vim-lsp']
```

NOTE: If you install [`vim-lsp-settings`](https://github.com/mattn/vim-lsp-settings) plugin, Using LspInstallServer
command are ok(need $PATH), but settings please keeping to disabled.
This plugin setting up efm-langserver to work.

### install command/plugin

- [efm-langserver](https://github.com/mattn/efm-langserver)
- lsp plugin
- linter/formatter commands if you need

## support command

| command                                                                  | type                                                                         | lint/format  | require / limitation | config status                            | note                                                                                                                                                                                                                                                                                                                    |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------- | ------------ | -------------------- | ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [vim-vint](https://pypi.org/project/vim-vint/)                           | vim                                                                          | lint         | pip                  | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| [markdownlint](https://www.npmjs.com/package/markdownlint)               | markdown                                                                     | lint         | npm                  | not need config / user config affected   | `.markdownlint.json` in the current directory.<br> [setting in project root sample](example/efm-langserver/root/.markdownlint.json).                                                                                                                                                                                    |
| [errata-ai/vale](https://github.com/errata-ai/vale)                      | text, markdown, rst, help                                                    | lint         | go                   | not included config / user config needed | `.vale.ini` in the current directory.<br> or in `$HOME` directory. <br> [setting in home sample](example/efm-langserver/home/.vale.ini).                                                                                                                                                                                |
| [koron/nvcheck](https://github.com/koron/nvcheck)                        | text, markdown, rst, help                                                    | lint, format | go                   | not included config / user config needed | `dict.yml` in the project root.<br> [sample in vimdoc-jp-working](https://github.com/vim-jp/vimdoc-ja-working/blob/master/dict.yml).                                                                                                                                                                                    |
| [htmlint](https://github.com/htmllint/htmllint-cli)                      | html                                                                         | lint         | npm                  | user config needed                       | ` .htmllintrc` in the project root.<br> Generate from command at `htmllint init`.                                                                                                                                                                                                                                       |
| [eslint](https://www.npmjs.com/package/eslint)                           | javascript, typescript                                                       | lint, format | npm                  | not need config / user config affected   | `.eslintrc.js`, `.eslintrc.yaml (yml)`, `.eslintrc.json` or setting into `package.json` in the project root.                                                                                                                                                                                                            |
| [stylelint](https://www.npmjs.com/package/stylelint)                     | css, scss, sass, less, sugarss                                               | lint         | npm                  | not included config / user config needed | `.stylelintrc.json` in the project root.                                                                                                                                                                                                                                                                                |
| [prettier](https://www.npmjs.com/package/prettier)                       | typescript, css, less, scss, json, json5, graphql, markdown, vue, yaml, html | format       | npm                  | not need config / user config affected   | setting into `package.json` in the project root.                                                                                                                                                                                                                                                                        |
| [flake8](https://pypi.org/project/flake8/)                               | python                                                                       | lint         | pip                  | not need config / user config affected   | `setup.cfg`, `tox.ini`, `.flake8` in project root.<br> `.flake8`, `~/.config/flake8` in home.                                                                                                                                                                                                                           |
| [mypy](https://pypi.org/project/mypy/)                                   | python                                                                       | lint         | pip                  | not need config / user config affected   | `mypy.ini`, `setup.cfg` in project root. <br> `.mypy.ini` in `$HOME` directory.                                                                                                                                                                                                                                         |
| [rubocop](https://rubygems.org/gems/rubocop)                             | ruby                                                                         | lint, format | bundle install need  | not need config / user config affected   | `.rubocop.yml` in project root.                                                                                                                                                                                                                                                                                         |
| [rufo](https://rubygems.org/gems/rufo/)                                  | ruby                                                                         | format       | bundle install need  | not need config / user config affected   | `.rufo` in project root.                                                                                                                                                                                                                                                                                                |
| [Cppcheck](http://cppcheck.sourceforge.net/)                             | c, cpp                                                                       | lint         |                      | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| [ShellCheck](https://www.shellcheck.net/)                                | sh                                                                           | lint         |                      | not need config / user config affected   | `.shellcheckrc` or `shellcheckrc` in the current directory(search parent upto root).<br> `.shellcheckrc` in `$HOME` directory. <br> XDG config directory (usually `~/.config/shellcheckrc` ) on Unix, or `%APPDATA%/shellcheckrc` on Windows. <br> [setting in home sample](example/efm-langserver/home/.shellcheckrc). |
| [shfmt mvdan/sh](https://github.com/mvdan/sh)                            | sh                                                                           | format       | go                   | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| [jsonlint](https://www.npmjs.com/package/jsonlint)                       | json                                                                         | lint         | npm                  | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| [jq](https://stedolan.github.io/jq/)                                     | json                                                                         | format       |                      | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| [fixjson](https://www.npmjs.com/package/fixjson)                         | json, json5                                                                  | format       | npm                  | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| [yamllint](https://pypi.org/project/yamllint/)                           | yaml                                                                         | lint         | pip                  | not need config / user config affected   | `.yamllint` , `.yamllint.yaml` or `.yamllint.yml` in the current working directory<br> config in $XDG\_CONFIG\_HOME `~/.config/yamllint/config`(support?).                                                                                                                                                              |
| [restructuredtext-lint](https://pypi.org/project/restructuredtext-lint/) | rst                                                                          | lint         | pip                  | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| [Pandoc](https://pandoc.org/)                                            | markdown, rst                                                                | format       |                      | not need config                          |                                                                                                                                                                                                                                                                                                                         |
| †[excitetranslate](https://github.com/mattn/excitetranslate)            | any (open file is not any defined type)                                      | hover        | go                   | not need config                          |                                                                                                                                                                                                                                                                                                                         |

If not command exists, command’s supporting type no setup.

**Please contribute any other linter setting(mapping, efm-langserver
setting, user setting sample)** If you contribute, fork and create PR.

## support codeAction

- Config Reload (any OS)
- Open Editor (any OS)
- Open Filer (mac,Windows)
- Open Browser (mac)
- Open Default Application (any OS)

## related

- [efm-langserver](https://github.com/mattn/efm-langserver)
- [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)

## Special Thanks

- [mattn \(mattn\)](https://github.com/mattn)
- [yaegassy \(yaegassy\)](https://github.com/yaegassy)
