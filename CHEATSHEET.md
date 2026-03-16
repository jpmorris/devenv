# Quick Reference Cheatsheet

## Keyboard Shortcuts - Unified Across All Environments

### Window Navigation (Same everywhere: Neovim, VSCode, Tmux)

<!-- prettier-ignore-start -->
| Action     | Keybinding | Context |
| ---------- | ---------- | ------- |
| Move left  | `Ctrl+h`   | All     |
| Move down  | `Ctrl+j`   | All     |
| Move up    | `Ctrl+k`   | All     |
| Move right | `Ctrl+l`   | All     |
<!-- prettier-ignore-end -->

### File Operations (Leader = Space)

<!-- prettier-ignore-start -->
| Action          | Keybinding    | Description                        |
| --------------- | ------------- | ---------------------------------- |
| Find files      | `<Space>pf`   | fzf-lua: all files from cwd        |
| Git files       | `Ctrl+p`      | fzf-lua: git-tracked files only    |
| Live grep       | `<Space>ps`   | fzf-lua: search file contents      |
| File explorer   | `<Space>pv`   | Open netrw (built-in file browser) |
| Format file     | `<Space>f`    | Format with LSP                    |
| Save            | `:w`          | Save current file                  |
| Quit            | `:q`          | Close current split/file           |
<!-- prettier-ignore-end -->

### Neovim Editor Splits (splits inside the editor, for viewing multiple files)

<!-- prettier-ignore-start -->
| Action           | Keybinding        | Description               |
| ---------------- | ----------------- | ------------------------- |
| Close split      | `:q`              | Close current split       |
| Cycle splits     | `Ctrl+w Ctrl+w`   | Cycle through all splits  |
| Move left/right  | `Ctrl+w h/l`      | Navigate between splits   |
| Move up/down     | `Ctrl+w j/k`      | Navigate between splits   |
| Split horizontal | `:sp [file]`      | Split editor horizontally |
| Split vertical   | `:vs [file]`      | Split editor vertically   |
<!-- prettier-ignore-end -->

### Tmux Lifecycle (from shell)

<!-- prettier-ignore-start -->
| Action         | Command                          | Description                |
| -------------- | -------------------------------- | -------------------------- |
| Start          | `tmux`                           | New unnamed session        |
| Start named    | `tmux new -s myproject`          | New named session          |
| Reattach       | `tmux attach`                    | Attach to last session     |
| Reattach named | `tmux attach -t myproject`       | Attach to specific session |
| List sessions  | `tmux ls`                        | See all running sessions   |
| Kill session   | `tmux kill-session -t myproject` | Destroy a session          |
<!-- prettier-ignore-end -->

## Tmux Shortcuts (Prefix = Ctrl+Space)

> `Ctrl+Space` = press and release, then press the next key

#### Essential

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
<!-- prettier-ignore-end -->

#### Other

<!-- prettier-ignore-start -->
| Action           | Keybinding                | Description                                  |
| ---------------- | ------------------------- | -------------------------------------------- |
| Rename window    | `Ctrl+Space ,`            | Rename current window                        |
| Close pane       | `Ctrl+Space x`            | Close current pane                           |
| Copy mode        | `Ctrl+Space [`            | Scroll/search output (vim keys, `q` to exit) |
| Reload config    | `Ctrl+Space r`            | Apply ~/.tmux.conf changes                   |
<!-- prettier-ignore-end -->

### Vim Motions (In Neovim and VSCode with Vim plugin)

<!-- prettier-ignore-start -->
| Motion     | Description              |
| ---------- | ------------------------ |
| `h j k l`  | Left, down, up, right    |
| `w`        | Next word start          |
| `b`        | Previous word start      |
| `e`        | End of word              |
| `0`        | Start of line            |
| `$`        | End of line              |
| `gg`       | Top of file              |
| `G`        | Bottom of file           |
| `{` `}`    | Previous/next paragraph  |
| `%`        | Jump to matching bracket |
| `f<char>`  | Find character forward   |
| `t<char>`  | 'Til character forward   |
| `;`        | Repeat last find         |
| `/pattern` | Search forward           |
| `n` `N`    | Next/previous match      |
<!-- prettier-ignore-end -->

### Vim Operations

<!-- prettier-ignore-start -->
| Operation | Description               |
| --------- | ------------------------- |
| `i`       | Insert before cursor      |
| `a`       | Insert after cursor       |
| `I`       | Insert at line start      |
| `A`       | Insert at line end        |
| `o`       | New line below            |
| `O`       | New line above            |
| `v`       | Visual mode               |
| `V`       | Visual line mode          |
| `Ctrl+v`  | Visual block mode         |
| `d`       | Delete (use with motions) |
| `dd`      | Delete line               |
| `y`       | Yank (copy)               |
| `yy`      | Yank line                 |
| `p`       | Paste after               |
| `P`       | Paste before              |
| `u`       | Undo                      |
| `Ctrl+r`  | Redo                      |
| `.`       | Repeat last change        |
<!-- prettier-ignore-end -->

### LSP / Code Actions (Neovim & VSCode)

<!-- prettier-ignore-start -->
| Action           | Neovim/VSCode | Description         |
| ---------------- | ------------- | ------------------- |
| Go to definition | `gd`          | Jump to definition  |
| Go to references | `gr`          | Find all references |
| Hover docs       | `K`           | Show documentation  |
| Rename           | `<Space>rn`   | Rename symbol       |
| Code action      | `<Space>ca`   | Quick fix/refactor  |
<!-- prettier-ignore-end -->

### Git (Leader + h prefix)

<!-- prettier-ignore-start -->
| Action     | Neovim/VSCode | Description            |
| ---------- | ------------- | ---------------------- |
| Stage hunk | `<Space>hs`   | Stage current change   |
| Reset hunk | `<Space>hr`   | Discard current change |
| Blame line | `<Space>hb`   | Show git blame         |
| Diff       | `<Space>hd`   | Show diff              |
<!-- prettier-ignore-end -->

## FZF Shortcuts (In Shell)

<!-- prettier-ignore-start -->
| Shortcut | Action                       |
| -------- | ---------------------------- |
| `Ctrl+t` | Fuzzy find files, paste path |
| `Ctrl+r` | Fuzzy search command history |
| `Alt+c`  | Fuzzy cd to directory        |
<!-- prettier-ignore-end -->

---

**Print this out or keep it handy while learning!**
