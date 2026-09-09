# nvim config

LazyVim-based, tuned for Go + Vue/TS/JS/HTML/CSS with GoLand-style keymaps and
[Herdr](https://herdr.dev) agent management via `MomePP/herd.nvim`.

## New machine setup

```sh
ln -s ~/dotfiles/nvim/.config/nvim ~/.config/nvim
```

Dependencies:

```sh
brew install neovim ripgrep fd go node pnpm
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
npm install -g tree-sitter-cli prettier
```

`herdr` isn't a brew/npm package — install it from https://herdr.dev.

Add to `~/.zshrc` (leader key is Ctrl-S, which the tty otherwise eats as
XON/XOFF flow control):

```sh
[[ $- == *i* ]] && stty -ixon
```

Then launch `nvim` — `lazy.nvim` bootstraps itself and installs plugins on
first run; Mason installs `gopls`, `vtsls`, `vue_ls`, `eslint`, `tailwindcss`,
`html`, `cssls`, `json-lsp`, `gofumpt`, `prettier`, and `delve` automatically.

## Keymaps (GoLand-style, leader = Ctrl-S)

| Combo | Action |
|---|---|
| `Ctrl+P` | Find files |
| `Ctrl+Shift+F` | Search text in all files |
| `Alt+Enter` | Code action / quick fix |
| `Ctrl+B` / `F12` | Go to definition |
| `Shift+F6` | Rename symbol |
| `Ctrl+Alt+L` | Format document |
| `Alt+F7` | Find references |
| `Ctrl+Shift+T` | Run nearest test |
| `Ctrl+Shift+H` / `<leader>h` | Toggle Herdr agent float |

Requires a terminal with the Kitty keyboard protocol (Ghostty, Kitty, WezTerm)
to distinguish `Ctrl+Shift+F` from `Ctrl+F`, `Alt+Enter` from `Enter`, etc.
"Shift+Shift" (GoLand's double-tap search) has no terminal keycode equivalent,
so `Ctrl+P` alone covers find-files.
