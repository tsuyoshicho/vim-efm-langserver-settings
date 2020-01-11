# vim-efm-langserver-settings

## detail
trial vim lsp client - efm-langserver link and configure settings


## installation
```vim
[[plugins]]
repo = 'tsuyoshicho/vim-efm-langserver-settings'
merged = 0
depends = ['vim-lsp']
```

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
[efm-langserver](https://github.com/mattn/efm-langserver)

