# AI-Powered Development Environment Setup

## Overview

This guide documents a unified development environment setup optimized for
AI-assisted coding across multiple platforms. The goal is to maintain consistent
keybindings and workflows whether you're using VSCode or Neovim/Tmux, on Linux
or WSL.

## Philosophy

- **Speed over Features**: Neovim/Tmux for day-to-day coding with AI assistance
- **Information Density when needed**: VSCode for screen sharing and complex
  debugging
- **Unified Keybindings**: Same muscle memory across all tools
- **Keyboard-First**: Minimize mouse usage
- **AI Integration**: Seamless integration with Claude Code (home) and Copilot
  CLI (work)
- **Discretion**: Easy to hide AI tools when needed at work

## Environments

While the information density and extensions of VSCode is very competitive with
neovim, in the age of AI agents, where code is being written less frequently,
neovim is becoming more competitive with CLI agents. The common critique of
VSCode's slowness also applies less and can run better on a weaker (read
work-assigned computer)

## Core Tools

- **WezTerm** - Modern Terminal (though Kitty and Windows Terminal are also
  options)
- **Neovim** - Primary Editor
  - download from github assets for latest version
- **Tmux** - Terminal Multiplexer
  - install from package manager
  - Plugins managed via [TPM](https://github.com/tmux-plugins/tpm): clone to
    `~/.tmux/plugins/tpm`, then press `Prefix + I` inside tmux to install
  - **tmux-resurrect** - manually save/restore sessions (`Prefix + Ctrl+s` /
    `Prefix + Ctrl+r`)
  - **tmux-continuum** - auto-saves session every 15 min and restores on tmux
    start
- **FZF** - Fuzzy Finder
  - install from package manager
- **fd / fdfind** - Fast alternative to `find`
  - install from package manager (`fd-find` on Debian/Ubuntu, `fd` on Arch); on
    Ubuntu symlink with `ln -s $(which fdfind) ~/.local/bin/fd`
- **sqlfluff** - SQL linter and formatter (`pip install sqlfluff`); used by
  conform.nvim for `.sql` files
- **ruff** - Fast Python linter and formatter (`pip install ruff`); used by
  conform.nvim for `.py` files
- **prettier** - Opinionated formatter for Markdown, JS, etc.
  (`npm install -g prettier`); used by conform.nvim for `.md` files
- **VSCode with Neovim Plugin**
  - Download latest zip and unzip
- **AI Tools**
  - Claude Code + Copilot CLI
    - Install from package manager
  - Copilot CLI only
    - Install from package manager

## Unified keybindings

There should be common shortcuts between neovim/tmux and VSCode to allow as easy
motion between the two applciationsa as possible. The VSCode settings are synced
by the vscode sync. The key that should be the same between the two environments
are:

- `Ctrl+h/j/k/l` - move windows (limited in VSCode cant move across markdown
  preview, terminal, or ai chat.
- `Ctrl+p` - Telescope-like open-file search
- `<space>sv` - split vertical
- `<space>vs` - split horizontal

## Session Recovery

The environment is configured for full session recovery after terminal close or
machine restart.

### Tmux (windows/panes)
- **tmux-continuum** auto-saves the tmux session every 15 minutes
- On `tmux` start, the last saved session is automatically restored (windows,
  panes, working directories, running programs)
- Manual save: `Prefix + Ctrl+s` | Manual restore: `Prefix + Ctrl+r`
- Sessions saved to: `~/.local/share/tmux/resurrect/`
- **Important**: after reboot, run `tmux` (not `tmux a`) to trigger auto-restore.
  If a server is already running with no sessions, run `tmux kill-server && tmux`

### Neovim (buffers/files)
- **auto-session** automatically saves and restores nvim state per working directory
- On nvim open in a directory, the previous session (open buffers, splits,
  cursor positions) is restored automatically
- Sessions saved to: `~/.local/share/nvim/sessions/`
- No manual steps required — save happens on `:q`, restore on next `nvim` launch
- Suppressed in `~/` and `/tmp` to avoid noisy root-level sessions

## Neovim Plugin Setup Notes

Notes on plugins that need extra setup steps beyond lazy.nvim's standard install.

---

## markdown-preview.nvim

Live markdown preview in your browser while editing in nvim.

### Linux (native)

Just works. lazy.nvim runs the build step (`cd app && npx --yes yarn install`)
and the plugin uses its pre-built binary automatically.

### WSL2 (work computer)

Two things need fixing: the corporate proxy (Zscaler) corrupts binary downloads,
and WSL2's network isolation means the browser opener needs `cmd.exe`.

#### 1. Install node dependencies manually

The lazy.nvim build step uses yarn, which may fail. Run this instead:

```bash
cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app
npm install
```

#### 2. Delete any corrupt pre-built binary

Zscaler blocks/corrupts `.tar.gz` downloads mid-transfer, leaving a truncated
binary that exists on disk but crashes silently. Delete it so the plugin falls
back to using `node`:

```bash
rm -rf ~/.local/share/nvim/lazy/markdown-preview.nvim/app/bin/
```

You can verify corruption with:
```bash
file ~/.local/share/nvim/lazy/markdown-preview.nvim/app/bin/markdown-preview-linux
# Bad:  "... missing section headers at ..."
# Good: file not found (fallback to node will be used)
```

#### 3. Add `cmd.exe` to PATH in the plugin config

The node server uses `cmd.exe` to open URLs in the Windows browser. WSL2 doesn't
include `C:\Windows\System32` in PATH by default.

In `~/.config/nvim/lua/jm/plugins/markdown-preview.lua`:

```lua
config = function()
  vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/markdown-preview.css")
  -- On WSL2, the node server needs cmd.exe in PATH to open the browser
  vim.env.PATH = vim.env.PATH .. ":/mnt/c/Windows/System32"
end,
```

#### Why this isn't in dotfiles

The `cmd.exe` PATH addition is WSL2-specific and harmless on native Linux
(the path simply won't exist). It's safe to commit to dotfiles.

The `npm install` and binary deletion steps only need to be run once after
initial install or after a `lazy update` pulls a new version of the plugin.
