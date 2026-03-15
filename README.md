# AI-Powered Development Environment Setup

## Overview

This guide documents a unified development environment setup optimized for AI-assisted coding across
multiple platforms. The goal is to maintain consistent keybindings and workflows whether you're
using VSCode or Neovim/Tmux, on Linux or WSL.

## Philosophy

- **Speed over Features**: Neovim/Tmux for day-to-day coding with AI assistance
- **Information Density when needed**: VSCode for screen sharing and complex debugging
- **Unified Keybindings**: Same muscle memory across all tools
- **Keyboard-First**: Minimize mouse usage
- **AI Integration**: Seamless integration with Claude Code (home) and Copilot CLI (work)
- **Discretion**: Easy to hide AI tools when needed at work

## Environments

| Environment   | OS             | Terminal                | Editor          | AI Tool                 |
| ------------- | -------------- | ----------------------- | --------------- | ----------------------- |
| Home Desktop  | Manjaro (i3)   | Terminator              | Neovim + VSCode | Claude Code             |
| Home Terminal | Manjaro (i3)   | Terminator/tmux         | Neovim          | Copilot CLI             |
| Work Terminal | Windows 11 WSL | Windows Terminal + tmux | Neovim          | Copilot CLI             |
| Work Desktop  | Windows 11 WSL | Windows Terminal        | VSCode          | None (Copilot disabled) |

## Core Tools

### 1. **Neovim** - Primary Editor

- Fast, keyboard-driven editing
- Consistent with VSCode Neovim plugin
- Powerful modal editing

### 2. **Tmux** - Terminal Multiplexer

- Multiple windows and panes
- Session persistence
- Easy window/tab management for hiding AI terminals
- Prefix key: `Ctrl+a` (easier than default `Ctrl+b`)

### 3. **FZF** - Fuzzy Finder

- Instant file opening by name
- Command history search
- Git file search
- Integration with vim and shell

### 4. **VSCode with Neovim Plugin**

- Use when screen sharing or needing GUI features
- Same keybindings as standalone Neovim
- Information-dense UI when needed

### 5. **AI Tools**

- **Home**: Claude Code + Copilot CLI
- **Work**: Copilot CLI only
- Quick key to hide: `Ctrl+a c` (new tmux window) or `Ctrl+a n` (next window)

## Key Features

### Fast File Navigation

**In Neovim:**

- `<leader>ff` - Find files (FZF)
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `:e filename` - Open by name

**In VSCode:**

- `Ctrl+p` - Quick open files
- `Ctrl+Shift+f` - Search in files
- `Ctrl+tab` - Switch buffers

### Multi-Window Workflow

**Tmux (terminal level):**

- `Ctrl+a |` - Split vertical
- `Ctrl+a -` - Split horizontal
- `Ctrl+a h/j/k/l` - Navigate panes (vim-style)
- `Ctrl+a c` - New window (tab)
- `Ctrl+a n` - Next window
- `Ctrl+a p` - Previous window
- `Ctrl+a 0-9` - Jump to window number

**Neovim (editor level):**

- `<leader>sv` - Split vertical
- `<leader>sh` - Split horizontal
- `Ctrl+h/j/k/l` - Navigate splits
- `:tabnew` - New tab
- `gt` / `gT` - Next/previous tab

**VSCode:**

- `Ctrl+\` - Split editor
- `Ctrl+h/j/k/l` - Navigate splits (with Neovim plugin)
- `Ctrl+pageup/pagedown` - Switch editor tabs

### Unified Keybindings Philosophy

All environments use **vim-style navigation** with `h/j/k/l`:

- `h` = left
- `j` = down
- `k` = up
- `l` = right

**Leader key**: `Space` (same in Neovim and VSCode)

## Quick Reference

### Emergency "Hide AI" Workflow (at work)

1. **Currently in terminal with Copilot CLI visible:**
   - `Ctrl+a c` - Creates new clean tmux window instantly
   - Or `Ctrl+a n` - Jump to next non-AI window
2. **To get back to AI:**
   - `Ctrl+a p` - Previous window
   - `Ctrl+a [number]` - Jump to specific window

3. **To switch to VSCode for screen share:**
   - `Alt+Tab` or `Win+number` (Windows)
   - Already running in background without Copilot extension

### Most Used Commands

**Opening Files:**

```bash
# In shell
vim $(fzf)           # Open file with fuzzy search

# In Neovim
<Space>ff            # Fuzzy find files
<Space>fg            # Grep in files
Ctrl+p               # Quick file open (VSCode style)

# In VSCode
Ctrl+p               # Quick open
```

**Window Management:**

```bash
# Tmux
Ctrl+a |             # Split vertically
Ctrl+a -             # Split horizontally
Ctrl+a <h/j/k/l>     # Navigate panes
Ctrl+a c             # New window
Ctrl+a n/p           # Next/previous window
Ctrl+a d             # Detach session (keep running)
tmux attach          # Reattach to session

# Neovim
<Space>sv            # Split vertical
<Space>sh            # Split horizontal
Ctrl+h/j/k/l         # Navigate splits
:tabnew              # New tab
gt / gT              # Tab navigation
```

**AI Tools:**

```bash
# Copilot CLI (work)
gh copilot suggest "what command to..."
gh copilot explain "command"

# Claude Code (home)
claude-code          # Start interactive session
```

## Installation Guide

### Prerequisites (Both Linux & WSL)

```bash
# Ubuntu/Debian (WSL)
sudo apt update
sudo apt install -y git curl build-essential

# Manjaro/Arch
sudo pacman -Syu
sudo pacman -S git curl base-devel
```

### 1. Install Neovim

```bash
# Ubuntu/Debian (WSL) - Install latest stable
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
source ~/.bashrc

# Manjaro/Arch
sudo pacman -S neovim

# Verify
nvim --version
```

### 2. Install Tmux

```bash
# Ubuntu/Debian (WSL)
sudo apt install -y tmux

# Manjaro/Arch
sudo pacman -S tmux

# Verify
tmux -V
```

### 3. Install FZF

```bash
# Universal installer
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# Answer 'y' to all prompts (fuzzy auto-completion, key bindings)

# This adds to your shell:
# Ctrl+r - command history search
# Ctrl+t - file search
# Alt+c - cd to directory
```

### 4. Install Ripgrep (better grep)

```bash
# Ubuntu/Debian (WSL)
sudo apt install -y ripgrep

# Manjaro/Arch
sudo pacman -S ripgrep
```

### 5. Install fd (faster find)

```bash
# Ubuntu/Debian (WSL)
sudo apt install -y fd-find
# fd is installed as 'fdfind' on Debian/Ubuntu - create alias
echo 'alias fd=fdfind' >> ~/.bashrc

# Manjaro/Arch
sudo pacman -S fd

# Verify
fd --version
```

### 6. Install zoxide (smarter cd)

```bash
# Universal installer
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Add to ~/.bashrc (or ~/.zshrc for zsh)
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
source ~/.bashrc

# Manjaro/Arch
sudo pacman -S zoxide

# Usage: 'z <partial-dir-name>' to jump to frecent directories
```

### 7. Install glow (markdown renderer)

```bash
# Ubuntu/Debian (WSL)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install -y glow

# Manjaro/Arch
sudo pacman -S glow

# Verify
glow --version
```

### 8. Setup Neovim with Plugin Manager (lazy.nvim)

```bash
# Create config directory
mkdir -p ~/.config/nvim

# Copy the init.lua from this repo
cp config/nvim/init.lua ~/.config/nvim/

# First run will auto-install plugins
nvim
```

### 9. Setup Tmux Configuration

```bash
# Copy tmux config
cp config/.tmux.conf ~/.tmux.conf

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux and install plugins
tmux
# Press Ctrl+a I (capital I) to install plugins
```

### 10. Install GitHub Copilot CLI

```bash
# Install GitHub CLI first
# Ubuntu/Debian (WSL)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Manjaro/Arch
sudo pacman -S github-cli

# Install Copilot extension
gh auth login
gh extension install github/gh-copilot

# Verify
gh copilot --version
```

### 11. Setup VSCode (Both Windows & Linux)

```bash
# Install VSCode from official website
# Windows: https://code.visualstudio.com/
# Linux: Use snap or package manager

# Install extensions
code --install-extension vscodevim.vim
code --install-extension ms-vscode-remote.remote-wsl  # Windows only
# DO NOT install Copilot at work

# Copy settings and keybindings
cp config/vscode/settings.json ~/.config/Code/User/settings.json  # Linux
cp config/vscode/keybindings.json ~/.config/Code/User/keybindings.json  # Linux

# Windows: Copy to %APPDATA%\Code\User\
```

### 12. Windows Terminal Setup (Work)

**Add to Windows Terminal settings.json:**

- Set default profile to WSL
- Configure keybindings for tab management
- See `config/windows-terminal/settings.json`

## Configuration Files

All configuration files are in the `config/` directory:

- `config/nvim/init.lua` - Neovim configuration
- `config/.tmux.conf` - Tmux configuration
- `config/.bashrc-additions` - Shell aliases and functions
- `config/vscode/settings.json` - VSCode settings
- `config/vscode/keybindings.json` - VSCode keybindings
- `config/windows-terminal/settings.json` - Windows Terminal settings

## Workflow Examples

### Typical Morning Routine

**At Work (Windows 11 WSL):**

1. Open Windows Terminal
2. `tmux attach` or start new session
3. `<leader>ff` to open first file
4. Work in Neovim, use `gh copilot` in separate tmux window
5. If meeting/screen share: `Alt+Tab` to VSCode (already open, no Copilot)

**At Home (Manjaro):**

1. `Win+Enter` (i3) to open Terminator
2. `tmux attach` or new session
3. Work flow same as above
4. Can use Claude Code or Copilot CLI freely

### AI-Assisted Coding Session

```bash
# Window 0: Main editing
nvim src/main.rs

# Create new window for AI
Ctrl+a c

# Window 1: Copilot CLI
gh copilot suggest "rust function to parse JSON"
# Copy suggestion back to Window 0 with Ctrl+a p

# Or use inline in nvim with Copilot.vim plugin
```

### Multi-File Editing

```bash
# Open project in neovim
cd ~/project
nvim .

# Use telescope for navigation
<Space>ff          # Find file by name
<Space>fg          # Search content
<Space>fb          # Switch between open buffers

# Split workflow
<Space>sv          # Split vertical
Ctrl+h/l           # Move between splits
```

## Tips & Tricks

### Shell Aliases

Add to `~/.bashrc`:

```bash
# Quick tmux session management
alias t='tmux'
alias ta='tmux attach'
alias tn='tmux new -s'

# Quick navigation
alias v='nvim'
alias vf='nvim $(fzf)'  # Open file with fuzzy find

# Git shortcuts
alias gs='git status'
alias gd='git diff'

# WSL specific - launch VSCode
alias c='code .'
```

### FZF + Vim Workflow

```bash
# Open file in vim using fzf from shell
v $(fzf)

# Or use Ctrl+t to paste file path, then
vim <Ctrl+t>

# Inside vim, use Telescope (configured in init.lua)
<Space>ff
```

### Tmux Session Management

```bash
# Named sessions for different projects
tmux new -s work-project
tmux new -s side-project
tmux new -s ai-experiments

# List sessions
tmux ls

# Attach to specific session
tmux attach -t work-project

# Switch between sessions (inside tmux)
Ctrl+a s    # Shows session list
```

### VSCode as a "Just in Case" Tool

- Keep VSCode open in background without Copilot
- Use for screen sharing or when you need:
  - Git graph visualization
  - Complex refactoring tools
  - Debugging UI
  - Extensions not available in vim
- Same Neovim keybindings work via Neovim plugin

## Learning Path

### Week 1: Basics

- [ ] Install all tools
- [ ] Learn basic tmux: splits, windows, navigation
- [ ] Practice `hjkl` navigation in Neovim
- [ ] Get comfortable with FZF (Ctrl+t, Ctrl+r)

### Week 2: Neovim

- [ ] Learn basic vim motions: `w`, `b`, `e`, `0`, `$`
- [ ] Practice `d`, `y`, `p` (delete, yank, paste)
- [ ] Use visual mode: `v`, `V`, `Ctrl+v`
- [ ] Learn Telescope: `<Space>ff`, `<Space>fg`

### Week 3: Integration

- [ ] Set up AI workflow (gh copilot or claude-code)
- [ ] Create multi-window workflows
- [ ] Practice "hide AI" scenario
- [ ] Configure VSCode with same keybindings

### Week 4: Advanced

- [ ] Learn vim macros: `q`, `@`
- [ ] Custom tmux scripting
- [ ] Advanced FZF integration
- [ ] Optimize your personal dotfiles

## Troubleshooting

### Neovim Clipboard Issues (WSL)

```bash
# Install win32yank for WSL clipboard integration
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

### Tmux Colors Look Wrong

```bash
# Add to ~/.bashrc
export TERM=xterm-256color
```

### VSCode Neovim Plugin Conflicts

- Disable any keybinding extensions that conflict
- Check `settings.json` for `vim.handleKeys` configuration
- See `config/vscode/settings.json` for working setup

## Resources

### Documentation

- [Neovim Docs](https://neovim.io/doc/)
- [Tmux Guide](https://github.com/tmux/tmux/wiki)
- [FZF Examples](https://github.com/junegunn/fzf#usage)
- [VSCode Vim Extension](https://github.com/VSCodeVim/Vim)

### Learning

- `vimtutor` - Built-in vim tutorial
- [Vim Adventures](https://vim-adventures.com/) - Game to learn vim
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)

### Communities

- r/neovim
- r/tmux
- GitHub Discussions for each tool

## Customization

All configs are meant to be starting points. Customize:

- Leader key (default: Space)
- Tmux prefix (default: Ctrl+a)
- Color schemes
- Plugin choices
- AI tool preferences

## Backup & Sync

Consider using a dotfiles repository:

```bash
# Create dotfiles repo
mkdir ~/dotfiles
cd ~/dotfiles
git init

# Symlink method
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/nvim ~/.config/nvim

# Sync across machines
git remote add origin <your-repo>
git push
```

## Next Steps

1. Copy this repository to both machines (work & home)
2. Follow installation guide for your OS
3. Copy and customize config files
4. Practice basic workflows for a week
5. Gradually add more advanced features

## Notes

- **At work**: Only use Copilot CLI in tmux windows you can quickly hide
- **At home**: Full freedom to use any AI tools
- **Consistency**: Same config files via git sync
- **Flexibility**: Can always fall back to VSCode for specific tasks

---

_Last updated: March 2026_
