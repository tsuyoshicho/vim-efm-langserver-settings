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
merged = 0
depends = ['vim-lsp']
```

### install command/plugin

- [efm-langserver](https://github.com/mattn/efm-langserver)
- lsp plugin
- linter commands if you need

## support linter

| linter       | type     | config status                          | lint/format | note               |
|--------------|----------|----------------------------------------|-------------|--------------------|
| vint         | vim      | not need config                        | lint        |                    |
| markdownlint | markdown | not need config / user config affected | lint        |                    |
| vale         | text     | config include / user config ignored   | lint        | currently not work |
| cppcheck     | c, cpp   | not need config                        | lint        |                    |
| shellcheck   | sh       | not need config / user config affected | lint        |                    |
| jq           | json     | not need config                        | format      |                    |

If not linter exists, not set support type at efm-langserver.

## related

- [efm-langserver](https://github.com/mattn/efm-langserver)
