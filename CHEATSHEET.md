# Development Environment Cheatsheet

## Window Navigation — Everywhere

Works in Neovim, VSCode, and Tmux panes.

| Keybinding | Action      |
| ---------- | ----------- |
| `Ctrl+h`   | Move left   |
| `Ctrl+j`   | Move down   |
| `Ctrl+k`   | Move up     |
| `Ctrl+l`   | Move right  |

## File Ops (Leader = Space)

| Keybinding    | Action                  |
| ------------- | ----------------------- |
| `<Spc>pf`     | Telescope: Find all files |
| `Ctrl+p`      | Telescope: Git-tracked files |
| `<Spc>ps`     | Live grep                |
| `<Spc>pv`     | File explorer (netrw)   |
| `<Spc>f`      | Format file (LSP)       |
| `:w`          | Save                    |
| `:q`          | Quit/close split        |

## Neovim Splits

| Keybinding     | Action           |
| -------------- | ---------------- |
| `:vs [f]`      | Split vertical   |
| `:sp [f]`      | Split horizontal |
| `Ctrl+w w`     | Cycle splits     |
| `Ctrl+w h/l`   | Left/right       |
| `Ctrl+w j/k`   | Up/down          |
| `:q`           | Close split      |

## Other Vim

| Keybinding     | Action                  |
| -------------- | ----------------------- |
| `gr`           | Find references         |
| `K`            | Hover docs              |
| `<Spc>ca`      | Code action             |
| `<Spc>hb`      | Git blame line          |
| `<Spc>hd`      | Show diff               |
| `e`            | End of word             |
| `{ / }`        | Prev/next paragraph     |
| `%`            | Jump matching bracket   |
| `f<c>`         | Find char forward       |
| `<Spc>rn`      | Rename symbol           |

## Tmux — From Shell

| Command                      | Action              |
| ---------------------------- | ------------------- |
| `tmux`                       | New session         |
| `tmux new -s <n>`           | New named session   |
| `tmux attach`                | Reattach last       |
| `tmux attach -t <n>`        | Reattach named      |
| `tmux ls`                    | List sessions       |
| `tmux kill-session -t <n>`  | Kill session        |

## Tmux Shortcuts (Prefix = Ctrl+Space)

> `Ctrl+Space` = press and release, then press the next key

<!-- prettier-ignore-start -->
| Action           | Keybinding                | Description                                  |
| ---------------- | ------------------------- | -------------------------------------------- |
| Navigate panes   | `Ctrl+h/j/k/l`            | Vim-style (no prefix needed)                 |
| Next window      | `Ctrl+n`                  | No prefix needed                             |
| Previous window  | `Ctrl+p`                  | No prefix needed                             |
| New window       | `Ctrl+Space c`            | **Create clean window**                      |
| Detach           | `Ctrl+Space d`            | **Back to shell (session keeps running)**    |
| Split vertical   | `Ctrl+\`                  | Split pane vertically (no prefix)            |
| Split horizontal | `Ctrl+]`                  | Split pane horizontally (no prefix)          |
| Jump to window   | `Ctrl+Space 1-9`          | Jump directly by number                      |
| Resize pane      | `Ctrl+Space H/J/K/L`     | Capital letters, hold to repeat              |
| Rename window    | `Ctrl+Space ,`            | Rename current window                        |
| Close pane       | `Ctrl+Space x`            | Close current pane                           |
| Copy mode        | `Ctrl+Space [`            | Scroll/search output (vim keys, `q` to exit) |
| Reload config    | `Ctrl+Space r`            | Apply ~/.tmux.conf changes                   |
<!-- prettier-ignore-end -->


## LSP / Code Actions (Neovim & VSCode)

<!-- prettier-ignore-start -->
| Action           | Neovim/VSCode | Description         |
| ---------------- | ------------- | ------------------- |
| Go to definition | `gd`          | Jump to definition  |
| Go to references | `gr`          | Find all references |
| Hover docs       | `K`           | Show documentation  |
| Rename           | `<Space>rn`   | Rename symbol       |
| Code action      | `<Space>ca`   | Quick fix/refactor  |
<!-- prettier-ignore-end -->

## Git (Leader + h prefix)

<!-- prettier-ignore-start -->
| Action           | Neovim/VSCode | Description                              |
| ---------------- | ------------- | ---------------------------------------- |
| Stage hunk       | `<Space>hs`   | Stage current change                     |
| Reset hunk       | `<Space>hr`   | Discard current change                   |
| Blame line       | `<Space>hb`   | Show git blame                           |
| Diff             | `<Space>hd`   | Show diff                                |
| Blame file       | `:Git blame`  | Full file blame (fugitive); `Enter` to jump to commit |
| Git file history | `<Space>gh`   | Browse file at any previous commit (telescope-git-file-history) |
<!-- prettier-ignore-end -->

## Spelling (Neovim)

<!-- prettier-ignore-start -->
| Keybinding | Action                                      |
| ---------- | ------------------------------------------- |
| `z=`       | Open suggestion picker at cursor (telescope) |
| `zf`       | Apply first suggestion immediately          |
| `]s`       | Jump to next misspelling                    |
| `[s`       | Jump to previous misspelling               |
| `zg`       | Mark word as good (add to dictionary)       |
| `zw`       | Mark word as wrong (add to bad word list)   |
<!-- prettier-ignore-end -->

## Copilot Chat (Leader = Space)

<!-- prettier-ignore-start -->
| Keybinding     | Mode          | Action                                        |
| -------------- | ------------- | --------------------------------------------- |
| `<Spc>cc`      | Normal        | Open Copilot Chat (current buffer as context) |
| `<Spc>cc`      | Visual        | Chat about selected code                      |
| `<Spc>ce`      | Visual        | Explain selection                             |
| `<Spc>cf`      | Visual        | Fix selection                                 |
| `<Spc>ct`      | Visual        | Generate tests for selection                  |
| `<Spc>cq`      | Normal        | Close chat                                    |
<!-- prettier-ignore-end -->

## FZF Shortcuts (In Shell)

<!-- prettier-ignore-start -->
| Shortcut | Action                       |
| -------- | ---------------------------- |
| `Ctrl+t` | Fuzzy find files, paste path |
| `Ctrl+r` | Fuzzy search command history |
| `Alt+c`  | Fuzzy cd to directory        |
<!-- prettier-ignore-end -->


## FZF, Zoxide

| Keybinding     | Action                      |
| -------------- | --------------------------- |
| `Ctrl+t`       | Fuzzy find file, paste path |
| `Ctrl+r`       | Fuzzy search history        |
| `Alt+c`        | Fuzzy cd to dir             |
| `z (fuzzy)`    | Fuzzy cd to dir             |
