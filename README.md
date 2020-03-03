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
If you install `vim-lsp-settings` plugin, Using LspInstallServer command are ok(need $PATH), but settings please keeping to disabled.
This plugin setting up efm-langserver to work.

### install command/plugin

- [efm-langserver](https://github.com/mattn/efm-langserver)
- lsp plugin
- linter/formatter commands if you need

## support linter

| command               | type                                                                         | config status                            | lint/format  | note                                                                                                                                                                                                                                                                                                                      |
|-----------------------|------------------------------------------------------------------------------|------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [vim-vint](https://pypi.org/project/vim-vint/)                  | vim                                                                          | not need config                          | lint         |                                                                                                                                                                                                                                                                                                                           |
| [markdownlint](https://www.npmjs.com/package/markdownlint)          | markdown                                                                     | not need config / user config affected   | lint, format | `.markdownlint.json` in the current directory.<br> [setting in project root sample](example/efm-langserver/root/.markdownlint.json).                                                                                                                                                                                      |
| [errata-ai/vale](https://github.com/errata-ai/vale)                  | text, markdown, rst, help                                                    | not included config / user config needed | lint         | `.vale.ini` in the current directory.<br> or in `$HOME` directory. <br> [setting in home sample](example/efm-langserver/home/.vale.ini).                                                                                                                                                                                  |
| [koron/nvcheck](https://github.com/koron/nvcheck)               | text, markdown, rst, help                                                    | not included config / user config needed | lint, format | `dict.yml` in the project root.<br> [sample in vimdoc-jp-working](https://github.com/vim-jp/vimdoc-ja-working/blob/master/dict.yml).                                                                                                                                                                                      |
| [eslint](https://www.npmjs.com/package/eslint)               | javascript, typescript                                                       | not need config / user config affected   | lint, format | `.eslintrc.js`, `.eslintrc.yaml (yml)`, `.eslintrc.json` or setting into `package.json` in the project root.                                                                                                                                                                                                              |
| [stylelint](https://www.npmjs.com/package/stylelint)             | css, scss, sass, less, sugarss                                               | not included config / user config needed | lint         | `.stylelintrc.json` in the project root.                                                                                                                                                                                                                                                                                  |
| [prettier](https://www.npmjs.com/package/prettier)        | typescript, css, less, scss, json, json5, graphql, markdown, vue, yaml, html | not need config / user config affected   | format       | setting into `package.json` in the project root.                                                                                                                                                                                                                                                                          |
| [flake8](https://pypi.org/project/flake8/)                | python                                                                       | not need config / user config affected   | lint         | `setup.cfg`, `tox.ini`, `.flake8` in project root.<br> `.flake8`, `~/.config/flake8` in home.                                                                                                                                                                                                                             |
| [mypi](https://pypi.org/project/mypi/)                  | python                                                                       | not need config / user config affected   | lint         | `mypy.ini`, `setup.cfg` in project root. <br> `.mypy.ini` in `$HOME` directory.                                                                                                                                                                                                                                           |
| [rubocop](https://rubygems.org/gems/rubocop)               | ruby                                                                         | not need config / user config affected   | lint         | `.rubocop.yml` in project root.                                                                                                                                                                                                                                                                                                           |
| [Cppcheck](http://cppcheck.sourceforge.net/)              | c, cpp                                                                       | not need config                          | lint         |                                                                                                                                                                                                                                                                                                                           |
| [ShellCheck](https://www.shellcheck.net/)            | sh                                                                           | not need config / user config affected   | lint         | `.shellcheckrc` or `shellcheckrc` in the current directory(search parent upto root).<br> `.shellcheckrc` in `$HOME` directory.  <br>  XDG config directory (usually `~/.config/shellcheckrc` ) on Unix, or `%APPDATA%/shellcheckrc` on Windows. <br> [setting in home sample](example/efm-langserver/home/.shellcheckrc). |
| [shfmt mvdan/sh](https://github.com/mvdan/sh)                 | sh                                                                           | not need config                          | format       |                                                                                                                                                                                                                                                                                                                           |
| [jq](https://stedolan.github.io/jq/)                    | json                                                                         | not need config                          | format       |                                                                                                                                                                                                                                                                                                                           |
| [rhysd/fixjson](https://github.com/rhysd/fixjson)               | json, json5                                                                  | not need config                          | format       |                                                                                                                                                                                                                                                                                                                           |
| [yamllint](https://pypi.org/project/yamllint/)              | yaml                                                                         | not need config / user config affected   | lint         | `.yamllint` , `.yamllint.yaml` or `.yamllint.yml` in the current working directory<br> config in $XDG_CONFIG_HOME `~/.config/yamllint/config`(support?).                                                                                                                                                                  |
| [restructuredtext-lint](https://pypi.org/project/restructuredtext-lint/) | rst                                                                          | not need config                          | lint         |                                                                                                                                                                                                                                                                                                                           |

If not command exists, command's supporting type no setup.

**Please contribute any other linter setting(mapping, efm-langserver setting, user setting sample)**
If you contribute, fork and create PR.

## related

- [efm-langserver](https://github.com/mattn/efm-langserver)
